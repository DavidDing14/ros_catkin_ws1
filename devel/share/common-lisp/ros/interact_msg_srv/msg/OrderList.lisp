; Auto-generated. Do not edit!


(cl:in-package interact_msg_srv-msg)


;//! \htmlinclude OrderList.msg.html

(cl:defclass <OrderList> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (cmds
    :reader cmds
    :initarg :cmds
    :type (cl:vector interact_msg_srv-msg:Order)
   :initform (cl:make-array 0 :element-type 'interact_msg_srv-msg:Order :initial-element (cl:make-instance 'interact_msg_srv-msg:Order))))
)

(cl:defclass OrderList (<OrderList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OrderList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OrderList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name interact_msg_srv-msg:<OrderList> is deprecated: use interact_msg_srv-msg:OrderList instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <OrderList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interact_msg_srv-msg:header-val is deprecated.  Use interact_msg_srv-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'cmds-val :lambda-list '(m))
(cl:defmethod cmds-val ((m <OrderList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interact_msg_srv-msg:cmds-val is deprecated.  Use interact_msg_srv-msg:cmds instead.")
  (cmds m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OrderList>) ostream)
  "Serializes a message object of type '<OrderList>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'cmds))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'cmds))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OrderList>) istream)
  "Deserializes a message object of type '<OrderList>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'cmds) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'cmds)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'interact_msg_srv-msg:Order))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OrderList>)))
  "Returns string type for a message object of type '<OrderList>"
  "interact_msg_srv/OrderList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OrderList)))
  "Returns string type for a message object of type 'OrderList"
  "interact_msg_srv/OrderList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OrderList>)))
  "Returns md5sum for a message object of type '<OrderList>"
  "2f9704fc3f08ad30048bbacbcdf53b64")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OrderList)))
  "Returns md5sum for a message object of type 'OrderList"
  "2f9704fc3f08ad30048bbacbcdf53b64")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OrderList>)))
  "Returns full string definition for message of type '<OrderList>"
  (cl:format cl:nil "# Define a serial of command with types and parameters.~%~%std_msgs/Header header~%~%~%# they will be done seriously and previous unexecuted cmds will be ignored,~%#  UNLESS the new CmdArray only contains __speedUp__, __speedDown__, __turnSpeedUp__, __turnSpeedDown__.~%Order[] cmds~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: interact_msg_srv/Order~%# Define a command with types and parameters.~%~%~%# Command Type:~%#  __go__            : move forward~%#  __turn__          : spin~%#  __speedUp__       : change linear speed~%#  __speedDown__     : change linear speed~%#  __turnSpeedUp__   : change angular speed~%#  __turnSpeedDown__ : change angular speed~%#  __stop__          : stop~%#  __goto__          : go to one place, one people~%#  __charge__        : power up~%~%string functionName~%~%# custom types~%#  DIRECTION : enum { 0:Left, 1:Right, 2:Back }~%#  QUANTIFIER : enum { 0:Step, 1:Meter, 2:Centimeterm 3:Degree }~%#  ADDRESS : string, specify a target (place or people)~%#  DEGREE : double~%#  DISTANCE : double~%#  ONE : \"1\", a bit~%~%# Parameter List of this command:~%#  __go__~%#    \"\"                           : no stop until blocked~%#    \"ONE\"~%#    \"DISTANCE|QUALIFIER\"         : (QUALIFIER != 3)~%#  __turn__~%#    \"DIRECTION\"                  : no stop~%#    \"DIRECTION|ONE\"~%#    \"DIRECTION|DEGREE|QUALIFIER\" ~%#  __goto__~%#    \"ADDRESS\"~%~%string pList~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OrderList)))
  "Returns full string definition for message of type 'OrderList"
  (cl:format cl:nil "# Define a serial of command with types and parameters.~%~%std_msgs/Header header~%~%~%# they will be done seriously and previous unexecuted cmds will be ignored,~%#  UNLESS the new CmdArray only contains __speedUp__, __speedDown__, __turnSpeedUp__, __turnSpeedDown__.~%Order[] cmds~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: interact_msg_srv/Order~%# Define a command with types and parameters.~%~%~%# Command Type:~%#  __go__            : move forward~%#  __turn__          : spin~%#  __speedUp__       : change linear speed~%#  __speedDown__     : change linear speed~%#  __turnSpeedUp__   : change angular speed~%#  __turnSpeedDown__ : change angular speed~%#  __stop__          : stop~%#  __goto__          : go to one place, one people~%#  __charge__        : power up~%~%string functionName~%~%# custom types~%#  DIRECTION : enum { 0:Left, 1:Right, 2:Back }~%#  QUANTIFIER : enum { 0:Step, 1:Meter, 2:Centimeterm 3:Degree }~%#  ADDRESS : string, specify a target (place or people)~%#  DEGREE : double~%#  DISTANCE : double~%#  ONE : \"1\", a bit~%~%# Parameter List of this command:~%#  __go__~%#    \"\"                           : no stop until blocked~%#    \"ONE\"~%#    \"DISTANCE|QUALIFIER\"         : (QUALIFIER != 3)~%#  __turn__~%#    \"DIRECTION\"                  : no stop~%#    \"DIRECTION|ONE\"~%#    \"DIRECTION|DEGREE|QUALIFIER\" ~%#  __goto__~%#    \"ADDRESS\"~%~%string pList~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OrderList>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'cmds) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OrderList>))
  "Converts a ROS message object to a list"
  (cl:list 'OrderList
    (cl:cons ':header (header msg))
    (cl:cons ':cmds (cmds msg))
))
