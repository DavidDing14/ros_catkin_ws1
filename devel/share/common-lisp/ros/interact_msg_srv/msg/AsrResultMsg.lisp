; Auto-generated. Do not edit!


(cl:in-package interact_msg_srv-msg)


;//! \htmlinclude AsrResultMsg.msg.html

(cl:defclass <AsrResultMsg> (roslisp-msg-protocol:ros-message)
  ((retcode
    :reader retcode
    :initarg :retcode
    :type cl:integer
    :initform 0)
   (ret_msg
    :reader ret_msg
    :initarg :ret_msg
    :type cl:string
    :initform "")
   (req_id
    :reader req_id
    :initarg :req_id
    :type cl:string
    :initform "")
   (session_id
    :reader session_id
    :initarg :session_id
    :type cl:string
    :initform "")
   (semantic_result
    :reader semantic_result
    :initarg :semantic_result
    :type cl:string
    :initform "")
   (reco_result
    :reader reco_result
    :initarg :reco_result
    :type cl:string
    :initform "")
   (tts_result
    :reader tts_result
    :initarg :tts_result
    :type cl:string
    :initform "")
   (answer_type
    :reader answer_type
    :initarg :answer_type
    :type cl:string
    :initform "")
   (music_url
    :reader music_url
    :initarg :music_url
    :type cl:string
    :initform ""))
)

(cl:defclass AsrResultMsg (<AsrResultMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AsrResultMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AsrResultMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name interact_msg_srv-msg:<AsrResultMsg> is deprecated: use interact_msg_srv-msg:AsrResultMsg instead.")))

(cl:ensure-generic-function 'retcode-val :lambda-list '(m))
(cl:defmethod retcode-val ((m <AsrResultMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interact_msg_srv-msg:retcode-val is deprecated.  Use interact_msg_srv-msg:retcode instead.")
  (retcode m))

(cl:ensure-generic-function 'ret_msg-val :lambda-list '(m))
(cl:defmethod ret_msg-val ((m <AsrResultMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interact_msg_srv-msg:ret_msg-val is deprecated.  Use interact_msg_srv-msg:ret_msg instead.")
  (ret_msg m))

(cl:ensure-generic-function 'req_id-val :lambda-list '(m))
(cl:defmethod req_id-val ((m <AsrResultMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interact_msg_srv-msg:req_id-val is deprecated.  Use interact_msg_srv-msg:req_id instead.")
  (req_id m))

(cl:ensure-generic-function 'session_id-val :lambda-list '(m))
(cl:defmethod session_id-val ((m <AsrResultMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interact_msg_srv-msg:session_id-val is deprecated.  Use interact_msg_srv-msg:session_id instead.")
  (session_id m))

(cl:ensure-generic-function 'semantic_result-val :lambda-list '(m))
(cl:defmethod semantic_result-val ((m <AsrResultMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interact_msg_srv-msg:semantic_result-val is deprecated.  Use interact_msg_srv-msg:semantic_result instead.")
  (semantic_result m))

(cl:ensure-generic-function 'reco_result-val :lambda-list '(m))
(cl:defmethod reco_result-val ((m <AsrResultMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interact_msg_srv-msg:reco_result-val is deprecated.  Use interact_msg_srv-msg:reco_result instead.")
  (reco_result m))

(cl:ensure-generic-function 'tts_result-val :lambda-list '(m))
(cl:defmethod tts_result-val ((m <AsrResultMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interact_msg_srv-msg:tts_result-val is deprecated.  Use interact_msg_srv-msg:tts_result instead.")
  (tts_result m))

(cl:ensure-generic-function 'answer_type-val :lambda-list '(m))
(cl:defmethod answer_type-val ((m <AsrResultMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interact_msg_srv-msg:answer_type-val is deprecated.  Use interact_msg_srv-msg:answer_type instead.")
  (answer_type m))

(cl:ensure-generic-function 'music_url-val :lambda-list '(m))
(cl:defmethod music_url-val ((m <AsrResultMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interact_msg_srv-msg:music_url-val is deprecated.  Use interact_msg_srv-msg:music_url instead.")
  (music_url m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AsrResultMsg>) ostream)
  "Serializes a message object of type '<AsrResultMsg>"
  (cl:let* ((signed (cl:slot-value msg 'retcode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'ret_msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'ret_msg))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'req_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'req_id))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'session_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'session_id))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'semantic_result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'semantic_result))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'reco_result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'reco_result))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'tts_result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'tts_result))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'answer_type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'answer_type))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'music_url))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'music_url))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AsrResultMsg>) istream)
  "Deserializes a message object of type '<AsrResultMsg>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'retcode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ret_msg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'ret_msg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'req_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'req_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'session_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'session_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'semantic_result) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'semantic_result) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'reco_result) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'reco_result) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tts_result) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'tts_result) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'answer_type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'answer_type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'music_url) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'music_url) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AsrResultMsg>)))
  "Returns string type for a message object of type '<AsrResultMsg>"
  "interact_msg_srv/AsrResultMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AsrResultMsg)))
  "Returns string type for a message object of type 'AsrResultMsg"
  "interact_msg_srv/AsrResultMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AsrResultMsg>)))
  "Returns md5sum for a message object of type '<AsrResultMsg>"
  "dddb0041baf54920d8b81ef590922632")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AsrResultMsg)))
  "Returns md5sum for a message object of type 'AsrResultMsg"
  "dddb0041baf54920d8b81ef590922632")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AsrResultMsg>)))
  "Returns full string definition for message of type '<AsrResultMsg>"
  (cl:format cl:nil "int32 retcode~%string ret_msg~%string req_id~%string session_id~%string semantic_result~%string reco_result~%string tts_result~%string answer_type~%string music_url~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AsrResultMsg)))
  "Returns full string definition for message of type 'AsrResultMsg"
  (cl:format cl:nil "int32 retcode~%string ret_msg~%string req_id~%string session_id~%string semantic_result~%string reco_result~%string tts_result~%string answer_type~%string music_url~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AsrResultMsg>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'ret_msg))
     4 (cl:length (cl:slot-value msg 'req_id))
     4 (cl:length (cl:slot-value msg 'session_id))
     4 (cl:length (cl:slot-value msg 'semantic_result))
     4 (cl:length (cl:slot-value msg 'reco_result))
     4 (cl:length (cl:slot-value msg 'tts_result))
     4 (cl:length (cl:slot-value msg 'answer_type))
     4 (cl:length (cl:slot-value msg 'music_url))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AsrResultMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'AsrResultMsg
    (cl:cons ':retcode (retcode msg))
    (cl:cons ':ret_msg (ret_msg msg))
    (cl:cons ':req_id (req_id msg))
    (cl:cons ':session_id (session_id msg))
    (cl:cons ':semantic_result (semantic_result msg))
    (cl:cons ':reco_result (reco_result msg))
    (cl:cons ':tts_result (tts_result msg))
    (cl:cons ':answer_type (answer_type msg))
    (cl:cons ':music_url (music_url msg))
))
