#!/usr/bin/env python

from interact_msg_srv.srv import *
import rospy

def handle_pointcloud(req):
    # print "Returning [%s + %s = %s]"%(req.a, req.b, (req.a + req.b))
    print 'get req'
    return PointCloudResponse(123)

def add_two_ints_server():
    rospy.init_node('viewer_buffer')
    s = rospy.Service('/interact_proj/pointcloud_srvs', PointCloud, handle_pointcloud)
    rospy.spin()

if __name__ == "__main__":
    add_two_ints_server()
