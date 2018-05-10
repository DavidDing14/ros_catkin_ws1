#!/usr/bin/env python

import sys
print sys.path

from interact_msg_srv.msg import NotifyGesture, PointDirection
from interact_msg_srv.srv import PointCloud
from geometry_msgs.msg import PointStamped
import rospy
import time

class GestureRecog():
    def __init__(self):
        self.notify_gesture = None
        self.pub = rospy.Publisher('/interact_proj/point_direction', PointDirection, queue_size=1)
        self.gesture_recog_server()

    def handle_notify_gesture(self, req):
        self.notify_gesture = req
        print type(self.notify_gesture)
        print self.notify_gesture.thingList
        rospy.wait_for_service('/interact_proj/pointcloud_srvs')
        try:
            get_pointcloud = rospy.ServiceProxy('/interact_proj/pointcloud_srvs', PointCloud)
            resp = get_pointcloud(rospy.get_rostime())
            
            # just for API test
            a = PointDirection()
            a.thingList = self.notify_gesture.thingList
            a.start.header.frame_id = 'base_laser_link'
            a.start.point.x = 2
            a.start.point.y = 2
            a.start.point.z = 2
            a.end.header.frame_id = 'base_laser_link'
            a.end.point.x = 1
            a.end.point.y = 1.5
            a.end.point.z = 1
            self.pub.publish(a)
            
            #return resp.test
        except rospy.ServiceException, e:
            print "Service call failed: %s" % e

    def gesture_recog_server(self):
        rospy.init_node('gesture_recog')
        rospy.Subscriber('/interact_proj/notify_gesture', NotifyGesture, self.handle_notify_gesture)
        rospy.spin()

if __name__ == "__main__":
    start = GestureRecog()
