; Auto-generated. Do not edit!


(cl:in-package interact_msg_srv-msg)


;//! \htmlinclude Order.msg.html

(cl:defclass <Order> (roslisp-msg-protocol:ros-message)
  ((functionName
    :reader functionName
    :initarg :functionName
    :type cl:string
    :initform "")
   (pList
    :reader pList
    :initarg :pList
    :type cl:string
    :initform ""))
)

(cl:defclass Order (<Order>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Order>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Order)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name interact_msg_srv-msg:<Order> is deprecated: use interact_msg_srv-msg:Order instead.")))

(cl:ensure-generic-function 'functionName-val :lambda-list '(m))
(cl:defmethod functionName-val ((m <Order>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interact_msg_srv-msg:functionName-val is deprecated.  Use interact_msg_srv-msg:functionName instead.")
  (functionName m))

(cl:ensure-generic-function 'pList-val :lambda-list '(m))
(cl:defmethod pList-val ((m <Order>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interact_msg_srv-msg:pList-val is deprecated.  Use interact_msg_srv-msg:pList instead.")
  (pList m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Order>) ostream)
  "Serializes a message object of type '<Order>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'functionName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'functionName))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'pList))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'pList))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Order>) istream)
  "Deserializes a message object of type '<Order>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'functionName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'functionName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pList) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'pList) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Order>)))
  "Returns string type for a message object of type '<Order>"
  "interact_msg_srv/Order")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Order)))
  "Returns string type for a message object of type 'Order"
  "interact_msg_srv/Order")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Order>)))
  "Returns md5sum for a message object of type '<Order>"
  "de7af7864b3678cd3ae3bf317f3d2c2f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Order)))
  "Returns md5sum for a message object of type 'Order"
  "de7af7864b3678cd3ae3bf317f3d2c2f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Order>)))
  "Returns full string definition for message of type '<Order>"
  (cl:format cl:nil "# Define a command with types and parameters.~%~%~%# Command Type:~%#  __go__            : move forward~%#  __turn__          : spin~%#  __speedUp__       : change linear speed~%#  __speedDown__     : change linear speed~%#  __turnSpeedUp__   : change angular speed~%#  __turnSpeedDown__ : change angular speed~%#  __stop__          : stop~%#  __goto__          : go to one place, one people~%#  __charge__        : power up~%~%string functionName~%~%# custom types~%#  DIRECTION : enum { 0:Left, 1:Right, 2:Back }~%#  QUANTIFIER : enum { 0:Step, 1:Meter, 2:Centimeterm 3:Degree }~%#  ADDRESS : string, specify a target (place or people)~%#  DEGREE : double~%#  DISTANCE : double~%#  ONE : \"1\", a bit~%~%# Parameter List of this command:~%#  __go__~%#    \"\"                           : no stop until blocked~%#    \"ONE\"~%#    \"DISTANCE|QUALIFIER\"         : (QUALIFIER != 3)~%#  __turn__~%#    \"DIRECTION\"                  : no stop~%#    \"DIRECTION|ONE\"~%#    \"DIRECTION|DEGREE|QUALIFIER\" ~%#  __goto__~%#    \"ADDRESS\"~%~%string pList~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Order)))
  "Returns full string definition for message of type 'Order"
  (cl:format cl:nil "# Define a command with types and parameters.~%~%~%# Command Type:~%#  __go__            : move forward~%#  __turn__          : spin~%#  __speedUp__       : change linear speed~%#  __speedDown__     : change linear speed~%#  __turnSpeedUp__   : change angular speed~%#  __turnSpeedDown__ : change angular speed~%#  __stop__          : stop~%#  __goto__          : go to one place, one people~%#  __charge__        : power up~%~%string functionName~%~%# custom types~%#  DIRECTION : enum { 0:Left, 1:Right, 2:Back }~%#  QUANTIFIER : enum { 0:Step, 1:Meter, 2:Centimeterm 3:Degree }~%#  ADDRESS : string, specify a target (place or people)~%#  DEGREE : double~%#  DISTANCE : double~%#  ONE : \"1\", a bit~%~%# Parameter List of this command:~%#  __go__~%#    \"\"                           : no stop until blocked~%#    \"ONE\"~%#    \"DISTANCE|QUALIFIER\"         : (QUALIFIER != 3)~%#  __turn__~%#    \"DIRECTION\"                  : no stop~%#    \"DIRECTION|ONE\"~%#    \"DIRECTION|DEGREE|QUALIFIER\" ~%#  __goto__~%#    \"ADDRESS\"~%~%string pList~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Order>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'functionName))
     4 (cl:length (cl:slot-value msg 'pList))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Order>))
  "Converts a ROS message object to a list"
  (cl:list 'Order
    (cl:cons ':functionName (functionName msg))
    (cl:cons ':pList (pList msg))
))
