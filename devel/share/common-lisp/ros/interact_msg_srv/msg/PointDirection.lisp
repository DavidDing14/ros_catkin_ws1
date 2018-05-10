; Auto-generated. Do not edit!


(cl:in-package interact_msg_srv-msg)


;//! \htmlinclude PointDirection.msg.html

(cl:defclass <PointDirection> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (thingList
    :reader thingList
    :initarg :thingList
    :type cl:string
    :initform "")
   (start
    :reader start
    :initarg :start
    :type geometry_msgs-msg:PointStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PointStamped))
   (end
    :reader end
    :initarg :end
    :type geometry_msgs-msg:PointStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PointStamped)))
)

(cl:defclass PointDirection (<PointDirection>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PointDirection>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PointDirection)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name interact_msg_srv-msg:<PointDirection> is deprecated: use interact_msg_srv-msg:PointDirection instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <PointDirection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interact_msg_srv-msg:header-val is deprecated.  Use interact_msg_srv-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'thingList-val :lambda-list '(m))
(cl:defmethod thingList-val ((m <PointDirection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interact_msg_srv-msg:thingList-val is deprecated.  Use interact_msg_srv-msg:thingList instead.")
  (thingList m))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <PointDirection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interact_msg_srv-msg:start-val is deprecated.  Use interact_msg_srv-msg:start instead.")
  (start m))

(cl:ensure-generic-function 'end-val :lambda-list '(m))
(cl:defmethod end-val ((m <PointDirection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interact_msg_srv-msg:end-val is deprecated.  Use interact_msg_srv-msg:end instead.")
  (end m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PointDirection>) ostream)
  "Serializes a message object of type '<PointDirection>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'thingList))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'thingList))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'start) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'end) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PointDirection>) istream)
  "Deserializes a message object of type '<PointDirection>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'thingList) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'thingList) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'start) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'end) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PointDirection>)))
  "Returns string type for a message object of type '<PointDirection>"
  "interact_msg_srv/PointDirection")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointDirection)))
  "Returns string type for a message object of type 'PointDirection"
  "interact_msg_srv/PointDirection")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PointDirection>)))
  "Returns md5sum for a message object of type '<PointDirection>"
  "fe38ff8272c6f45b734d63f62a50cfab")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PointDirection)))
  "Returns md5sum for a message object of type 'PointDirection"
  "fe38ff8272c6f45b734d63f62a50cfab")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PointDirection>)))
  "Returns full string definition for message of type '<PointDirection>"
  (cl:format cl:nil "std_msgs/Header header~%string thingList # 如：\"Door\"这个字符串代表物体有Door~%geometry_msgs/PointStamped start # 代表指向的起点~%geometry_msgs/PointStamped end # 代表指向的终点~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PointStamped~%# This represents a Point with reference coordinate frame and timestamp~%Header header~%Point point~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PointDirection)))
  "Returns full string definition for message of type 'PointDirection"
  (cl:format cl:nil "std_msgs/Header header~%string thingList # 如：\"Door\"这个字符串代表物体有Door~%geometry_msgs/PointStamped start # 代表指向的起点~%geometry_msgs/PointStamped end # 代表指向的终点~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PointStamped~%# This represents a Point with reference coordinate frame and timestamp~%Header header~%Point point~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PointDirection>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'thingList))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'start))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'end))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PointDirection>))
  "Converts a ROS message object to a list"
  (cl:list 'PointDirection
    (cl:cons ':header (header msg))
    (cl:cons ':thingList (thingList msg))
    (cl:cons ':start (start msg))
    (cl:cons ':end (end msg))
))
