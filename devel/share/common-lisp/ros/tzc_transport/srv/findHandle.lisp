; Auto-generated. Do not edit!


(cl:in-package tzc_transport-srv)


;//! \htmlinclude findHandle-request.msg.html

(cl:defclass <findHandle-request> (roslisp-msg-protocol:ros-message)
  ((timeStamp
    :reader timeStamp
    :initarg :timeStamp
    :type cl:real
    :initform 0))
)

(cl:defclass findHandle-request (<findHandle-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <findHandle-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'findHandle-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tzc_transport-srv:<findHandle-request> is deprecated: use tzc_transport-srv:findHandle-request instead.")))

(cl:ensure-generic-function 'timeStamp-val :lambda-list '(m))
(cl:defmethod timeStamp-val ((m <findHandle-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tzc_transport-srv:timeStamp-val is deprecated.  Use tzc_transport-srv:timeStamp instead.")
  (timeStamp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <findHandle-request>) ostream)
  "Serializes a message object of type '<findHandle-request>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'timeStamp)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'timeStamp) (cl:floor (cl:slot-value msg 'timeStamp)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <findHandle-request>) istream)
  "Deserializes a message object of type '<findHandle-request>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timeStamp) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<findHandle-request>)))
  "Returns string type for a service object of type '<findHandle-request>"
  "tzc_transport/findHandleRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'findHandle-request)))
  "Returns string type for a service object of type 'findHandle-request"
  "tzc_transport/findHandleRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<findHandle-request>)))
  "Returns md5sum for a message object of type '<findHandle-request>"
  "72658d7436d535dac18c2c6563a14a73")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'findHandle-request)))
  "Returns md5sum for a message object of type 'findHandle-request"
  "72658d7436d535dac18c2c6563a14a73")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<findHandle-request>)))
  "Returns full string definition for message of type '<findHandle-request>"
  (cl:format cl:nil "time timeStamp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'findHandle-request)))
  "Returns full string definition for message of type 'findHandle-request"
  (cl:format cl:nil "time timeStamp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <findHandle-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <findHandle-request>))
  "Converts a ROS message object to a list"
  (cl:list 'findHandle-request
    (cl:cons ':timeStamp (timeStamp msg))
))
;//! \htmlinclude findHandle-response.msg.html

(cl:defclass <findHandle-response> (roslisp-msg-protocol:ros-message)
  ((data_handle
    :reader data_handle
    :initarg :data_handle
    :type cl:integer
    :initform 0))
)

(cl:defclass findHandle-response (<findHandle-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <findHandle-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'findHandle-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tzc_transport-srv:<findHandle-response> is deprecated: use tzc_transport-srv:findHandle-response instead.")))

(cl:ensure-generic-function 'data_handle-val :lambda-list '(m))
(cl:defmethod data_handle-val ((m <findHandle-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tzc_transport-srv:data_handle-val is deprecated.  Use tzc_transport-srv:data_handle instead.")
  (data_handle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <findHandle-response>) ostream)
  "Serializes a message object of type '<findHandle-response>"
  (cl:let* ((signed (cl:slot-value msg 'data_handle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <findHandle-response>) istream)
  "Deserializes a message object of type '<findHandle-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data_handle) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<findHandle-response>)))
  "Returns string type for a service object of type '<findHandle-response>"
  "tzc_transport/findHandleResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'findHandle-response)))
  "Returns string type for a service object of type 'findHandle-response"
  "tzc_transport/findHandleResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<findHandle-response>)))
  "Returns md5sum for a message object of type '<findHandle-response>"
  "72658d7436d535dac18c2c6563a14a73")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'findHandle-response)))
  "Returns md5sum for a message object of type 'findHandle-response"
  "72658d7436d535dac18c2c6563a14a73")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<findHandle-response>)))
  "Returns full string definition for message of type '<findHandle-response>"
  (cl:format cl:nil "int64 data_handle~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'findHandle-response)))
  "Returns full string definition for message of type 'findHandle-response"
  (cl:format cl:nil "int64 data_handle~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <findHandle-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <findHandle-response>))
  "Converts a ROS message object to a list"
  (cl:list 'findHandle-response
    (cl:cons ':data_handle (data_handle msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'findHandle)))
  'findHandle-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'findHandle)))
  'findHandle-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'findHandle)))
  "Returns string type for a service object of type '<findHandle>"
  "tzc_transport/findHandle")