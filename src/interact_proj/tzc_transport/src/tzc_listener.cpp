#include "ros/ros.h"
#include "tzc_transport/tzc_topic.hpp"
#include "tzc_transport/tzc_image.hpp"
#include <unistd.h>
#include <opencv2/opencv.hpp>
#include <vector>
#include <cmath>
#include <tzc_transport/findHandle.h>
#include <std_msgs/Float64.h>
#include <unordered_map>

// __USE_UNORDERED_MAP__ :
//	1 : vector
//	2 : unordered_map

#define __USE_UNORDERED_MAP__ 2

using namespace tzc_transport;

ros::Duration totalTime(0);
long totalImage = 1;

double minDuration = 0.001;	//dxh when release image, the duration between aim and dataHandler[i], see Func :: releaseCallback() for detail

#if __USE_UNORDERED_MAP__ == 1

class dataHandler	//dxh  save timeStamp and data_handle, so that we can find data_handle with timeStamp, and use data_handle with pobj to find data_address
{
public:
  ros::Time timeStamp;
  long data_handle;
public:
  dataHandler(ros::Time timeStamp, long data_handle) {
    this->timeStamp = timeStamp;
    this->data_handle = data_handle;
    releaseOrNot = 1;
  }
  ~dataHandler() {
  }
  void releaseThis() {
    releaseOrNot = 0;
  }
  bool getReleaseInfo() {
    return releaseOrNot;
  }
private:
  bool releaseOrNot;	//dxh 1 on create, 0 when release, see Func :: releaseCallback() for detail
};

std::vector<dataHandler> dataBuffer;	//dxh

#elif __USE_UNORDERED_MAP__ == 2

std::unordered_map<double, long> mapBuffer;	//an unordered_map of ros::Time(timeStamp) to long(data_handle)

#endif	// container statement

#if __USE_UNORDERED_MAP__ == 1

void chatterCallback(const ImageConstPtr & msg) {
  //ROS_INFO("I heard: [%d, %f] deltaT=%fms \n data_handle=%ld  ref=%d", *(uint32_t *)msg->data, msg->header.stamp.toSec(),
  //         (ros::Time::now() - msg->header.stamp).toSec() * 1000.0, msg->data_handle, msg->pobj_->pmsg_->getRef());

  //ROS_INFO("msg->height = %d, msg->width = %d", msg->height, msg->width);
  ros::Duration t_ = ros::Time::now() - msg->header.stamp;
  totalTime += t_;
  ROS_INFO("time duration = %f", totalTime.toSec()/totalImage);
  totalImage += 1;
  dataHandler newData(msg->header.stamp, msg->data_handle);	//dxh
  if(dataBuffer.size()>=100)
  {
    //ROS_INFO("erase data = %f", dataBuffer[0].timeStamp.toSec());
    dataBuffer.erase(dataBuffer.begin());
  }
  dataBuffer.push_back(newData);

/*
  ShmManager * pshm = new tzc_transport::ShmManager(boost::interprocess::open_only, "_kinect2_raw_color");
  long prev_handle = msg->pobj_->pmsg_->getPrev();
  ShmMessage * prevData = (ShmMessage *)pshm->get_address_from_handle(prev_handle);
  for(int ic = 0; ic<=10; ++ic){
    prev_handle = prevData->getPrev();
    prevData = (ShmMessage *)pshm->get_address_from_handle(prev_handle);
  }
  ROS_INFO("prevData : timeStamp = %f", prevData->getTimeStamp());
*/
//show image that we get
//  cv::Mat rgbmat;

//  cv::Mat(msg->height, msg->width, CV_8UC4, data).copyTo(rgbmat);
//  cv::imshow("rgb", rgbmat);
//  cv::waitKey(0);
 

   //sleep(1); // pretend doing complex work
}

bool findHandle_(tzc_transport::findHandle::Request &req, tzc_transport::findHandle::Response &res)
{
  double reqtoSec = req.timeStamp.toSec();
  ROS_INFO("request: timeStamp = %f", reqtoSec);
  double minSec = fabs(dataBuffer[0].timeStamp.toSec() - reqtoSec);
  int imageNo = 0;
  for (int i=1; i<dataBuffer.size(); ++i)
  {
    if (dataBuffer[i].getReleaseInfo() == 0) {
      continue;
    }
    ROS_INFO("%d %f %f ", i, dataBuffer[i].timeStamp.toSec(), fabs(dataBuffer[i].timeStamp.toSec() - reqtoSec));
    if(fabs(dataBuffer[i].timeStamp.toSec() - reqtoSec) < minSec)
    {
      minSec = fabs(dataBuffer[i].timeStamp.toSec() - reqtoSec);
      imageNo = i;
    }
  }
/*	//dxh cannot find version
  if(minSec > 10)
  {
    res.data_handle = -1;
  }
  else
  {
    res.data_handle = dataBuffer[imageNo].data_handle;
  }
*/

  ShmManager * pshm = new tzc_transport::ShmManager(boost::interprocess::open_only, "_kinect2_raw_pointcloud");
  ShmMessage * msgData = (ShmMessage *)pshm->get_address_from_handle(dataBuffer[imageNo].data_handle);
  msgData->addSaveRef();
  res.data_handle = dataBuffer[imageNo].data_handle;
  
  ROS_INFO("sending back response: [%ld]", (long int)imageNo);
  ROS_INFO("dataBuffer[imageNo].timeStamp = %f", dataBuffer[imageNo].timeStamp.toSec());
  ROS_INFO("timediff = %lf", minSec);

  return true;
}

void releaseCallback(const std_msgs::Float64::ConstPtr & msg) {
  //ROS_INFO("release msg->data = %f", msg->data);
  for (int i=0; i<dataBuffer.size(); ++i)
  {
    if (dataBuffer[i].timeStamp.toSec() == msg->data)
    {
      //ROS_INFO("FIND IT, imageNo = %d", i);
      dataBuffer[i].releaseThis();
      break;
    }
  }
}

#elif __USE_UNORDERED_MAP__ == 2

void chatterCallback(const ImageConstPtr & msg) {
  ros::Duration t_ = ros::Time::now() - msg->header.stamp;
  totalTime += t_;
  ROS_INFO("time duration = %f", totalTime.toSec()/totalImage);
  totalImage += 1;
  //std::pair<double, long> newData (msg->header.stamp.toSec(), msg->data_handle);
  //mapBuffer.insert(newData);
  mapBuffer[msg->header.stamp.toSec()] = msg->data_handle;
  //ROS_INFO("mapBuffer.size() = %d", mapBuffer.size());
}

bool findHandle_(tzc_transport::findHandle::Request &req, tzc_transport::findHandle::Response &res)
{
  double reqtoSec = req.timeStamp.toSec();
  ROS_INFO("request: timeStamp = %f", reqtoSec);
  double minSec = 100000;
  bool findit = false;
  std::unordered_map<double, long>::iterator imageNo;
  std::unordered_map<double, long>::iterator x;  
  for (x = mapBuffer.begin(); x != mapBuffer.end(); ++x)
  {
    if(fabs(x->first - reqtoSec) < minSec)
    {
      minSec = fabs(x->first - reqtoSec);
      imageNo = x;
      findit = true;
    }
  }
/*	//dxh cannot find version
  if(minSec > 10)
  {
    res.data_handle = -1;
  }
  else
  {
    res.data_handle = dataBuffer[imageNo].data_handle;
  }
*/
  if (findit) {	//findit is to avoid minSec = 100000 problem, if time duration too big, imageNo would be null
    ShmManager * pshm = new tzc_transport::ShmManager(boost::interprocess::open_only, "_kinect2_raw_pointcloud");
    ShmMessage * msgData = (ShmMessage *)pshm->get_address_from_handle(imageNo->second);
    msgData->addSaveRef();
    res.data_handle = imageNo->second;
  } else {
    res.data_handle = -1;
  }
  

  return true;
}

void releaseCallback(const std_msgs::Float64::ConstPtr & msg) {
  std::unordered_map<double, long>::const_iterator got = mapBuffer.find (msg->data);

  if ( got == mapBuffer.end() ) 
  {
    //ROS_INFO("not found a image to release");
  }
  else
  {
    //ROS_INFO("found image %f, data_handle is %ld", got->first, got->second);
    mapBuffer.erase(got);
  }
}

#endif

int main(int argc, char ** argv) {
  ros::init(argc, argv, "tzc_listener", ros::init_options::AnonymousName);
  ros::NodeHandle n;
  Topic t(n);
  //ImageSubscriber s = t.subscribe< Image >("tzc_test_topic", 1, &chatterCallback);
  ImageSubscriber s = t.subscribe< Image >("/kinect2/raw/pointcloud", 30, &chatterCallback);
  
  ros::NodeHandle nd;	//dxh
  ros::ServiceServer service = nd.advertiseService("find_Handle", findHandle_);	//dxh
  ROS_INFO("Ready to findImage with stamp");	//dxh

  ros::NodeHandle np_;	//dxh
  ros::Subscriber sub_np_ = np_.subscribe("release_time", 30, releaseCallback);
  ROS_INFO("Ready to get release time");

  ros::spin();
  return 0;
}

