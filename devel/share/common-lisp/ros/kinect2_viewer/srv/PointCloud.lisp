; Auto-generated. Do not edit!


(cl:in-package kinect2_viewer-srv)


;//! \htmlinclude PointCloud-request.msg.html

(cl:defclass <PointCloud-request> (roslisp-msg-protocol:ros-message)
  ((a
    :reader a
    :initarg :a
    :type cl:real
    :initform 0))
)

(cl:defclass PointCloud-request (<PointCloud-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PointCloud-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PointCloud-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kinect2_viewer-srv:<PointCloud-request> is deprecated: use kinect2_viewer-srv:PointCloud-request instead.")))

(cl:ensure-generic-function 'a-val :lambda-list '(m))
(cl:defmethod a-val ((m <PointCloud-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kinect2_viewer-srv:a-val is deprecated.  Use kinect2_viewer-srv:a instead.")
  (a m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PointCloud-request>) ostream)
  "Serializes a message object of type '<PointCloud-request>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'a)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'a) (cl:floor (cl:slot-value msg 'a)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PointCloud-request>) istream)
  "Deserializes a message object of type '<PointCloud-request>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'a) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PointCloud-request>)))
  "Returns string type for a service object of type '<PointCloud-request>"
  "kinect2_viewer/PointCloudRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointCloud-request)))
  "Returns string type for a service object of type 'PointCloud-request"
  "kinect2_viewer/PointCloudRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PointCloud-request>)))
  "Returns md5sum for a message object of type '<PointCloud-request>"
  "2a538a6bfd3558365d95b62ad54c313a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PointCloud-request)))
  "Returns md5sum for a message object of type 'PointCloud-request"
  "2a538a6bfd3558365d95b62ad54c313a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PointCloud-request>)))
  "Returns full string definition for message of type '<PointCloud-request>"
  (cl:format cl:nil "time a~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PointCloud-request)))
  "Returns full string definition for message of type 'PointCloud-request"
  (cl:format cl:nil "time a~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PointCloud-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PointCloud-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PointCloud-request
    (cl:cons ':a (a msg))
))
;//! \htmlinclude PointCloud-response.msg.html

(cl:defclass <PointCloud-response> (roslisp-msg-protocol:ros-message)
  ((point_cloud
    :reader point_cloud
    :initarg :point_cloud
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2))
   (color
    :reader color
    :initarg :color
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (depth
    :reader depth
    :initarg :depth
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass PointCloud-response (<PointCloud-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PointCloud-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PointCloud-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kinect2_viewer-srv:<PointCloud-response> is deprecated: use kinect2_viewer-srv:PointCloud-response instead.")))

(cl:ensure-generic-function 'point_cloud-val :lambda-list '(m))
(cl:defmethod point_cloud-val ((m <PointCloud-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kinect2_viewer-srv:point_cloud-val is deprecated.  Use kinect2_viewer-srv:point_cloud instead.")
  (point_cloud m))

(cl:ensure-generic-function 'color-val :lambda-list '(m))
(cl:defmethod color-val ((m <PointCloud-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kinect2_viewer-srv:color-val is deprecated.  Use kinect2_viewer-srv:color instead.")
  (color m))

(cl:ensure-generic-function 'depth-val :lambda-list '(m))
(cl:defmethod depth-val ((m <PointCloud-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kinect2_viewer-srv:depth-val is deprecated.  Use kinect2_viewer-srv:depth instead.")
  (depth m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PointCloud-response>) ostream)
  "Serializes a message object of type '<PointCloud-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'point_cloud) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'color) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'depth) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PointCloud-response>) istream)
  "Deserializes a message object of type '<PointCloud-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'point_cloud) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'color) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'depth) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PointCloud-response>)))
  "Returns string type for a service object of type '<PointCloud-response>"
  "kinect2_viewer/PointCloudResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointCloud-response)))
  "Returns string type for a service object of type 'PointCloud-response"
  "kinect2_viewer/PointCloudResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PointCloud-response>)))
  "Returns md5sum for a message object of type '<PointCloud-response>"
  "2a538a6bfd3558365d95b62ad54c313a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PointCloud-response)))
  "Returns md5sum for a message object of type 'PointCloud-response"
  "2a538a6bfd3558365d95b62ad54c313a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PointCloud-response>)))
  "Returns full string definition for message of type '<PointCloud-response>"
  (cl:format cl:nil "sensor_msgs/PointCloud2 point_cloud~%sensor_msgs/Image color~%sensor_msgs/Image depth~%~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PointCloud-response)))
  "Returns full string definition for message of type 'PointCloud-response"
  (cl:format cl:nil "sensor_msgs/PointCloud2 point_cloud~%sensor_msgs/Image color~%sensor_msgs/Image depth~%~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PointCloud-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'point_cloud))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'color))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'depth))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PointCloud-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PointCloud-response
    (cl:cons ':point_cloud (point_cloud msg))
    (cl:cons ':color (color msg))
    (cl:cons ':depth (depth msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PointCloud)))
  'PointCloud-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PointCloud)))
  'PointCloud-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointCloud)))
  "Returns string type for a service object of type '<PointCloud>"
  "kinect2_viewer/PointCloud")