; Auto-generated. Do not edit!


(cl:in-package interact_msg_srv-msg)


;//! \htmlinclude NotifyGesture.msg.html

(cl:defclass <NotifyGesture> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (thingList
    :reader thingList
    :initarg :thingList
    :type cl:string
    :initform ""))
)

(cl:defclass NotifyGesture (<NotifyGesture>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NotifyGesture>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NotifyGesture)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name interact_msg_srv-msg:<NotifyGesture> is deprecated: use interact_msg_srv-msg:NotifyGesture instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <NotifyGesture>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interact_msg_srv-msg:header-val is deprecated.  Use interact_msg_srv-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'thingList-val :lambda-list '(m))
(cl:defmethod thingList-val ((m <NotifyGesture>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interact_msg_srv-msg:thingList-val is deprecated.  Use interact_msg_srv-msg:thingList instead.")
  (thingList m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NotifyGesture>) ostream)
  "Serializes a message object of type '<NotifyGesture>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'thingList))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'thingList))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NotifyGesture>) istream)
  "Deserializes a message object of type '<NotifyGesture>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'thingList) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'thingList) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NotifyGesture>)))
  "Returns string type for a message object of type '<NotifyGesture>"
  "interact_msg_srv/NotifyGesture")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NotifyGesture)))
  "Returns string type for a message object of type 'NotifyGesture"
  "interact_msg_srv/NotifyGesture")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NotifyGesture>)))
  "Returns md5sum for a message object of type '<NotifyGesture>"
  "f4b5c04a62afe1985a4b1bf327f914ca")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NotifyGesture)))
  "Returns md5sum for a message object of type 'NotifyGesture"
  "f4b5c04a62afe1985a4b1bf327f914ca")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NotifyGesture>)))
  "Returns full string definition for message of type '<NotifyGesture>"
  (cl:format cl:nil "std_msgs/Header header~%~%string thingList~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NotifyGesture)))
  "Returns full string definition for message of type 'NotifyGesture"
  (cl:format cl:nil "std_msgs/Header header~%~%string thingList~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NotifyGesture>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'thingList))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NotifyGesture>))
  "Converts a ROS message object to a list"
  (cl:list 'NotifyGesture
    (cl:cons ':header (header msg))
    (cl:cons ':thingList (thingList msg))
))
