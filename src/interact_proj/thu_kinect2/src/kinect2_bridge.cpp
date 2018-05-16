/*********************************************************************
* Software License Agreement (BSD License)
*
*  Copyright (c) 2008, Willow Garage, Inc.
*  All rights reserved.
*
*  Redistribution and use in source and binary forms, with or without
*  modification, are permitted provided that the following conditions
*  are met:
*
*   * Redistributions of source code must retain the above copyright
*     notice, this list of conditions and the following disclaimer.
*   * Redistributions in binary form must reproduce the above
*     copyright notice, this list of conditions and the following
*     disclaimer in the documentation and/or other materials provided
*     with the distribution.
*   * Neither the name of the Willow Garage nor the names of its
*     contributors may be used to endorse or promote products derived
*     from this software without specific prior written permission.
*
*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
*  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
*  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
*  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
*  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
*  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
*  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
*  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
*  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
*  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
*  POSSIBILITY OF SUCH DAMAGE.
*********************************************************************/

#define __USE_SHM_TRANSPORT__ 2

#include <ros/ros.h>

#if __USE_SHM_TRANSPORT__ == 1
  #include <shm_transport/shm_topic.hpp>
#elif __USE_SHM_TRANSPORT__ == 2
  #include <tzc_transport/tzc_topic.hpp>
  #include <tzc_transport/tzc_image.hpp>
#endif

#include <sensor_msgs/Image.h>
#include <sensor_msgs/CameraInfo.h>
#include <sensor_msgs/image_encodings.h>

#include <opencv2/opencv.hpp>

#include <libfreenect2/libfreenect2.hpp>
#include <libfreenect2/frame_listener_impl.h>
#include <libfreenect2/packet_pipeline.h>
#include <libfreenect2/config.h>
#include <libfreenect2/registration.h>

#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl/io/pcd_io.h>
#include <pcl/visualization/cloud_viewer.h>
#include <pcl_ros/point_cloud.h>	//dxh
#include <pcl_conversions/pcl_conversions.h>	//dxh

namespace thu_kinect2
{

class Kinect2Bridge
{
private:
  ros::NodeHandle nh_;
  ros::NodeHandle np_;
#if __USE_SHM_TRANSPORT__ == 1
  shm_transport::Topic topic_;
  shm_transport::Publisher pub_color_, pub_ir_, pub_depth_;
#elif __USE_SHM_TRANSPORT__ == 2
  tzc_transport::Topic topic_;
  tzc_transport::ImagePublisher pub_color_, pub_ir_, pub_depth_;
  tzc_transport::ImagePublisher pub_pcl_;	//dxh pointCloud publisher
#else
  ros::Publisher pub_color_, pub_ir_, pub_depth_;
#endif

  libfreenect2::Freenect2 freenect2_;
  libfreenect2::PacketPipeline * freenect2_pipeline_;
  libfreenect2::SyncMultiFrameListener * freenect2_listener_color_;
  libfreenect2::SyncMultiFrameListener * freenect2_listener_irdepth_;
  libfreenect2::Freenect2Device * freenect2_device_;

public:
#if __USE_SHM_TRANSPORT__ == 1
  Kinect2Bridge() : nh_(), topic_(nh_), freenect2_() {
#elif __USE_SHM_TRANSPORT__ == 2
  Kinect2Bridge() : nh_(), np_(), topic_(nh_, np_), freenect2_() {
#else
  Kinect2Bridge() : nh_(), freenect2_() {
#endif
    const int nDev = freenect2_.enumerateDevices();
    if (nDev <= 0)
      throw std::string("No kinect2 device!");
    std::string ser = freenect2_.getDefaultDeviceSerialNumber();

#ifdef LIBFREENECT2_WITH_CUDA_SUPPORT
    ROS_INFO("Using cuda version...");
    throw std::string("cuda version not implemented!");
#elif defined(LIBFREENECT2_WITH_OPENCL_SUPPORT)
    ROS_INFO("Using opencl version...");
    freenect2_pipeline_ = new libfreenect2::OpenCLPacketPipeline(-1);
#elif defined(LIBFREENECT2_WITH_OPENGL_SUPPORT)
    ROS_INFO("Using opengl version...");
    throw std::string("opengl version not implemented!");
#else
    ROS_INFO("Using cpu version...");
    throw std::string("cpu version not implemented!");
#endif

    freenect2_listener_color_ = new libfreenect2::SyncMultiFrameListener(libfreenect2::Frame::Color);
    freenect2_listener_irdepth_ = new libfreenect2::SyncMultiFrameListener(libfreenect2::Frame::Ir | libfreenect2::Frame::Depth);

    freenect2_device_ = freenect2_.openDevice(ser, freenect2_pipeline_);
    freenect2_device_->setColorFrameListener(freenect2_listener_color_);
    freenect2_device_->setIrAndDepthFrameListener(freenect2_listener_irdepth_);
#if __USE_SHM_TRANSPORT__ == 0
    pub_color_ = nh_.advertise<sensor_msgs::Image>("/kinect2/raw/color", 30);
    pub_ir_    = nh_.advertise<sensor_msgs::Image>("/kinect2/raw/ir", 30);
    pub_depth_ = nh_.advertise<sensor_msgs::Image>("/kinect2/raw/depth", 30);
#elif __USE_SHM_TRANSPORT__ == 1
    pub_color_ = topic_.advertise<sensor_msgs::Image>("/kinect2/raw/color", 30, 100 * 1024 * 1024);
    pub_ir_    = topic_.advertise<sensor_msgs::Image>("/kinect2/raw/ir", 30, 10 * 1024 * 1024);
    pub_depth_ = topic_.advertise<sensor_msgs::Image>("/kinect2/raw/depth", 30, 10 * 1024 * 1024);
#else
    pub_color_ = topic_.advertise<tzc_transport::Image>("/kinect2/raw/color", 30, 100 * 1024 * 1024);
    pub_ir_    = topic_.advertise<tzc_transport::Image>("/kinect2/raw/ir", 30, 10 * 1024 * 1024);
    pub_depth_ = topic_.advertise<tzc_transport::Image>("/kinect2/raw/depth", 30, 10 * 1024 * 1024);
    pub_pcl_ = topic_.advertise<tzc_transport::Image>("/kinect2/raw/pointcloud", 30, 200 * 1024 * 1024);
#endif
  }
  ~Kinect2Bridge() {
    delete freenect2_listener_color_;
    delete freenect2_listener_irdepth_;
  }
  int start() {
    int res = freenect2_device_->start();
    if (!res)
      return res;
    res = freenect2_device_->startStreams(true, true);
    return res;
  }
  int stop() {
    return freenect2_device_->stop();
  }
  void spinOnce() {
    libfreenect2::FrameMap frames;
    cv::Mat rgbMat, depthMat;
    if (freenect2_listener_irdepth_->waitForNewFrame(frames, 100)) {
      libfreenect2::Frame * frameIr = frames[libfreenect2::Frame::Ir];
      libfreenect2::Frame * frameDepth = frames[libfreenect2::Frame::Depth];
//      ROS_INFO("received ir frames: %d(%lux%lu)", frameIr->status, frameIr->width, frameIr->height);
//      ROS_INFO("received depth frames: %d(%lux%lu)", frameDepth->status, frameDepth->width, frameDepth->height);

      publishImage(pub_ir_, frameIr); //, "IR");
      publishImage(pub_depth_, frameDepth); //, "DEPTH");
//ROS_INFO("framedepth = %d", sizeof(frameDepth->data[0]));
      cv::Mat(frameDepth->height, frameDepth->width, CV_32FC1, frameDepth->data).copyTo(depthMat);	//dxh

      freenect2_listener_irdepth_->release(frames);
    }
    if (freenect2_listener_color_->waitForNewFrame(frames, 100)) {
      libfreenect2::Frame * frameColor = frames[libfreenect2::Frame::Color];
//      ROS_INFO("received color frames: %d(%lux%lu)", frameColor->status, frameColor->width, frameColor->height);

      publishImage(pub_color_, frameColor); //, "COLOR");

//ROS_INFO("framecolor = %d", sizeof(frameColor->data[0]));
      cv::Mat(frameColor->height, frameColor->width, CV_8UC4, frameColor->data).copyTo(rgbMat);	//dxh
   
      freenect2_listener_color_->release(frames);
    }

    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZ> () );
    cloud=depth2cloud(rgbMat, depthMat);
//ROS_INFO("x = %f, y = %f, z = %f", cloud->points[0].x, cloud->points[0].y, cloud->points[0].z);
//ROS_INFO("cloud type is %s", typeid(cloud->points[0].x).name());
    publishPCL(pub_pcl_, cloud);

  }
private:
#if __USE_SHM_TRANSPORT__ == 2
  pcl::PointCloud<pcl::PointXYZ>::Ptr depth2cloud( cv::Mat rgb_image, cv::Mat depth_image ) {
    float f = 570.3;
    float cx = 320.0, cy = 240.0;

    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_ptr( new pcl::PointCloud<pcl::PointXYZ> () );
    cloud_ptr->width  = rgb_image.cols;
    cloud_ptr->height = rgb_image.rows;
    cloud_ptr->is_dense = false;

    for ( int y = 0; y < rgb_image.rows; ++ y ) {
        for ( int x = 0; x < rgb_image.cols; ++ x ) {
            pcl::PointXYZ pt;
            if ( depth_image.at<unsigned short>(y, x) != 0 )
            {
                pt.z = depth_image.at<unsigned short>(y, x)/1000.0;
                pt.x = (x-cx)*pt.z/f;
                pt.y = (y-cy)*pt.z/f;
                //pt.r = rgb_image.at<cv::Vec3b>(y, x)[2];
                //pt.g = rgb_image.at<cv::Vec3b>(y, x)[1];
                //pt.b = rgb_image.at<cv::Vec3b>(y, x)[0];
                cloud_ptr->points.push_back( pt );
            }
            else
            {
                pt.x = std::numeric_limits<float>::quiet_NaN();
                pt.y = std::numeric_limits<float>::quiet_NaN();
                pt.z = std::numeric_limits<float>::quiet_NaN();
                //pt.r = rgb_image.at<cv::Vec3b>(y, x)[2];
                //pt.g = rgb_image.at<cv::Vec3b>(y, x)[1];
                //pt.b = rgb_image.at<cv::Vec3b>(y, x)[0];
                cloud_ptr->points.push_back( pt );
            }
        }
    }
    return cloud_ptr;
  }

  void publishPCL(tzc_transport::ImagePublisher & pub, pcl::PointCloud<pcl::PointXYZ>::Ptr & pframe) {
     if (pub.getNumSubscribers() > 0) {
      tzc_transport::Image msg;
      msg.header.stamp = ros::Time::now();
      msg.height = pframe->height;
      msg.width = pframe->width;
      msg.is_bigendian = false;

      msg.encoding = "PointCloud";
      msg.step = pframe->width * 12;	//float_ x y z 4+4+4=12 bytes
      msg.data_size = msg.step * msg.height;
      if (!pub.prepare(msg))
        return;
      //cv::Mat src(pframe->height, pframe->width, CV_8UC4, pframe->data);
      //cv::Mat dst(msg.height, msg.width, CV_8UC3, msg.data);
      //cv::cvtColor(src, dst, CV_BGRA2BGR);

      for(int i=0; i<pframe->points.size(); ++i) {
	int shiftBytes = i*12;
        uint8_t bAry[4];
	uint8_t* lpAry = bAry;
	*( float* )lpAry = pframe->points[i].x;
	for (int j=0; j<4; ++j) {
	  *(msg.data + shiftBytes + j) = lpAry[j];
	}
	*( float* )lpAry = pframe->points[i].y;
	for (int j=0; j<4; ++j) {
	  *(msg.data + shiftBytes + j + 4) = lpAry[j];
	}
	*( float* )lpAry = pframe->points[i].z;
	for (int j=0; j<4; ++j) {
	  *(msg.data + shiftBytes + j + 8) = lpAry[j];
	}
      }

      pub.publish(msg);
    }
  }
#endif

  void showImage(libfreenect2::Frame * pframe) {
    cv::Mat rgbmat;

    cv::Mat(pframe->height, pframe->width, CV_8UC3, pframe->data).copyTo(rgbmat);
    cv::imshow("rgb", rgbmat);
    cv::waitKey(0);
  }

#if __USE_SHM_TRANSPORT__ == 2
  void publishImage(tzc_transport::ImagePublisher & pub, libfreenect2::Frame * pframe) { //, char* outStr) {
    if (pframe->status == 0 && pub.getNumSubscribers() > 0) {
      tzc_transport::Image msg;
      msg.header.stamp = ros::Time::now();
      msg.height = pframe->height;
      msg.width = pframe->width;
      msg.is_bigendian = false;
      if (pframe->format == libfreenect2::Frame::BGRX) {
        msg.encoding = sensor_msgs::image_encodings::BGR8;
        msg.step = pframe->width * 3;
        msg.data_size = msg.step * msg.height;
        if (!pub.prepare(msg))
          return;
        cv::Mat src(pframe->height, pframe->width, CV_8UC4, pframe->data);
        cv::Mat dst(msg.height, msg.width, CV_8UC3, msg.data);
        cv::cvtColor(src, dst, CV_BGRA2BGR);
	//ROS_INFO("%s use BGRX", outStr);
      } else if (pframe->format == libfreenect2::Frame::RGBX) {
        msg.encoding = sensor_msgs::image_encodings::BGR8;
        msg.step = pframe->width * 3;
        msg.data_size = msg.step * msg.height;
        if (!pub.prepare(msg))
          return;
        cv::Mat src(pframe->height, pframe->width, CV_8UC4, pframe->data);
        cv::Mat dst(msg.height, msg.width, CV_8UC3, msg.data);
        cv::cvtColor(src, dst, CV_RGBA2BGR);
	//ROS_INFO("%s use RGBX", outStr);
      } else if (pframe->format == libfreenect2::Frame::Float) {
        msg.encoding = sensor_msgs::image_encodings::TYPE_16UC1;
        msg.step = pframe->width * 2;
        msg.data_size = msg.step * msg.height;
        if (!pub.prepare(msg))
          return;
        cv::Mat src(pframe->height, pframe->width, CV_32FC1, pframe->data);
        cv::Mat dst(msg.height, msg.width, CV_16U, msg.data);
        src.convertTo(dst, CV_16U);
	//ROS_INFO("%s use Float", outStr);
      }
      pub.publish(msg);
    }
  }
#else

#if __USE_SHM_TRANSPORT__ == 0
  void publishImage(ros::Publisher & pub, libfreenect2::Frame * pframe) {
#elif __USE_SHM_TRANSPORT__ == 1
  void publishImage(shm_transport::Publisher & pub, libfreenect2::Frame * pframe) {
#endif
    if (pframe->status == 0 && pub.getNumSubscribers() > 0) {
      sensor_msgs::Image msg;
      msg.header.stamp = ros::Time::now();
      msg.height = pframe->height;
      msg.width = pframe->width;
      msg.is_bigendian = false;
      if (pframe->format == libfreenect2::Frame::BGRX) {
        msg.encoding = sensor_msgs::image_encodings::BGR8;
        msg.step = pframe->width * 3;
        int size = msg.step * msg.height;
        msg.data.resize(size);
        cv::Mat src(pframe->height, pframe->width, CV_8UC4, pframe->data);
        cv::Mat dst(msg.height, msg.width, CV_8UC3, msg.data.data());
        cv::cvtColor(src, dst, CV_BGRA2BGR);
      } else if (pframe->format == libfreenect2::Frame::RGBX) {
        msg.encoding = sensor_msgs::image_encodings::BGR8;
        msg.step = pframe->width * 3;
        cv::Mat src(pframe->height, pframe->width, CV_8UC4, pframe->data);
        cv::Mat dst(msg.height, msg.width, CV_8UC3, msg.data.data());
        cv::cvtColor(src, dst, CV_RGBA2BGR);
      } else if (pframe->format == libfreenect2::Frame::Float) {
        msg.encoding = sensor_msgs::image_encodings::TYPE_16UC1;
        msg.step = pframe->width * 2;
        int size = msg.step * msg.height;
        msg.data.resize(size);
        cv::Mat src(pframe->height, pframe->width, CV_32FC1, pframe->data);
        cv::Mat dst(msg.height, msg.width, CV_16U, msg.data.data());
        src.convertTo(dst, CV_16U);
      }
      pub.publish(msg);
    }
  }
#endif
}; // class Kinect2Bridge

} // namespace thu_kinect2

int main(int argc, char **argv)
{
  ros::init(argc, argv, "kinect2_bridge", ros::init_options::AnonymousName);

  thu_kinect2::Kinect2Bridge * kinect2;
  try {
    kinect2 = new thu_kinect2::Kinect2Bridge();
  } catch (std::string s) {
    ROS_INFO("Exception: %s", s.c_str());
    ros::shutdown();
    return 0;
  }
  kinect2->start();

  while (ros::ok()) {
    kinect2->spinOnce();
    ros::spinOnce();
  }

  kinect2->stop();
  delete kinect2;

  ros::shutdown();
  return 0;
}
