; Auto-generated. Do not edit!


(cl:in-package move_pick_place-srv)


;//! \htmlinclude ChatGpt-request.msg.html

(cl:defclass <ChatGpt-request> (roslisp-msg-protocol:ros-message)
  ((prompt
    :reader prompt
    :initarg :prompt
    :type cl:string
    :initform ""))
)

(cl:defclass ChatGpt-request (<ChatGpt-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChatGpt-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChatGpt-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name move_pick_place-srv:<ChatGpt-request> is deprecated: use move_pick_place-srv:ChatGpt-request instead.")))

(cl:ensure-generic-function 'prompt-val :lambda-list '(m))
(cl:defmethod prompt-val ((m <ChatGpt-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader move_pick_place-srv:prompt-val is deprecated.  Use move_pick_place-srv:prompt instead.")
  (prompt m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChatGpt-request>) ostream)
  "Serializes a message object of type '<ChatGpt-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'prompt))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'prompt))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChatGpt-request>) istream)
  "Deserializes a message object of type '<ChatGpt-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'prompt) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'prompt) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChatGpt-request>)))
  "Returns string type for a service object of type '<ChatGpt-request>"
  "move_pick_place/ChatGptRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChatGpt-request)))
  "Returns string type for a service object of type 'ChatGpt-request"
  "move_pick_place/ChatGptRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChatGpt-request>)))
  "Returns md5sum for a message object of type '<ChatGpt-request>"
  "e0e4e53d8b56a3ee57408d4081b2c754")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChatGpt-request)))
  "Returns md5sum for a message object of type 'ChatGpt-request"
  "e0e4e53d8b56a3ee57408d4081b2c754")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChatGpt-request>)))
  "Returns full string definition for message of type '<ChatGpt-request>"
  (cl:format cl:nil "string prompt ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChatGpt-request)))
  "Returns full string definition for message of type 'ChatGpt-request"
  (cl:format cl:nil "string prompt ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChatGpt-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'prompt))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChatGpt-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ChatGpt-request
    (cl:cons ':prompt (prompt msg))
))
;//! \htmlinclude ChatGpt-response.msg.html

(cl:defclass <ChatGpt-response> (roslisp-msg-protocol:ros-message)
  ((response
    :reader response
    :initarg :response
    :type cl:string
    :initform ""))
)

(cl:defclass ChatGpt-response (<ChatGpt-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChatGpt-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChatGpt-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name move_pick_place-srv:<ChatGpt-response> is deprecated: use move_pick_place-srv:ChatGpt-response instead.")))

(cl:ensure-generic-function 'response-val :lambda-list '(m))
(cl:defmethod response-val ((m <ChatGpt-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader move_pick_place-srv:response-val is deprecated.  Use move_pick_place-srv:response instead.")
  (response m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChatGpt-response>) ostream)
  "Serializes a message object of type '<ChatGpt-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'response))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'response))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChatGpt-response>) istream)
  "Deserializes a message object of type '<ChatGpt-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'response) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'response) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChatGpt-response>)))
  "Returns string type for a service object of type '<ChatGpt-response>"
  "move_pick_place/ChatGptResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChatGpt-response)))
  "Returns string type for a service object of type 'ChatGpt-response"
  "move_pick_place/ChatGptResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChatGpt-response>)))
  "Returns md5sum for a message object of type '<ChatGpt-response>"
  "e0e4e53d8b56a3ee57408d4081b2c754")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChatGpt-response)))
  "Returns md5sum for a message object of type 'ChatGpt-response"
  "e0e4e53d8b56a3ee57408d4081b2c754")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChatGpt-response>)))
  "Returns full string definition for message of type '<ChatGpt-response>"
  (cl:format cl:nil "string response~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChatGpt-response)))
  "Returns full string definition for message of type 'ChatGpt-response"
  (cl:format cl:nil "string response~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChatGpt-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'response))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChatGpt-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ChatGpt-response
    (cl:cons ':response (response msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ChatGpt)))
  'ChatGpt-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ChatGpt)))
  'ChatGpt-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChatGpt)))
  "Returns string type for a service object of type '<ChatGpt>"
  "move_pick_place/ChatGpt")