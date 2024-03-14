;; Auto-generated. Do not edit!


(when (boundp 'chatgpt_connector::ChatGpt)
  (if (not (find-package "CHATGPT_CONNECTOR"))
    (make-package "CHATGPT_CONNECTOR"))
  (shadow 'ChatGpt (find-package "CHATGPT_CONNECTOR")))
(unless (find-package "CHATGPT_CONNECTOR::CHATGPT")
  (make-package "CHATGPT_CONNECTOR::CHATGPT"))
(unless (find-package "CHATGPT_CONNECTOR::CHATGPTREQUEST")
  (make-package "CHATGPT_CONNECTOR::CHATGPTREQUEST"))
(unless (find-package "CHATGPT_CONNECTOR::CHATGPTRESPONSE")
  (make-package "CHATGPT_CONNECTOR::CHATGPTRESPONSE"))

(in-package "ROS")





(defclass chatgpt_connector::ChatGptRequest
  :super ros::object
  :slots (_prompt ))

(defmethod chatgpt_connector::ChatGptRequest
  (:init
   (&key
    ((:prompt __prompt) "")
    )
   (send-super :init)
   (setq _prompt (string __prompt))
   self)
  (:prompt
   (&optional __prompt)
   (if __prompt (setq _prompt __prompt)) _prompt)
  (:serialization-length
   ()
   (+
    ;; string _prompt
    4 (length _prompt)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _prompt
       (write-long (length _prompt) s) (princ _prompt s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _prompt
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _prompt (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass chatgpt_connector::ChatGptResponse
  :super ros::object
  :slots (_response ))

(defmethod chatgpt_connector::ChatGptResponse
  (:init
   (&key
    ((:response __response) "")
    )
   (send-super :init)
   (setq _response (string __response))
   self)
  (:response
   (&optional __response)
   (if __response (setq _response __response)) _response)
  (:serialization-length
   ()
   (+
    ;; string _response
    4 (length _response)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _response
       (write-long (length _response) s) (princ _response s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _response
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _response (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass chatgpt_connector::ChatGpt
  :super ros::object
  :slots ())

(setf (get chatgpt_connector::ChatGpt :md5sum-) "e0e4e53d8b56a3ee57408d4081b2c754")
(setf (get chatgpt_connector::ChatGpt :datatype-) "chatgpt_connector/ChatGpt")
(setf (get chatgpt_connector::ChatGpt :request) chatgpt_connector::ChatGptRequest)
(setf (get chatgpt_connector::ChatGpt :response) chatgpt_connector::ChatGptResponse)

(defmethod chatgpt_connector::ChatGptRequest
  (:response () (instance chatgpt_connector::ChatGptResponse :init)))

(setf (get chatgpt_connector::ChatGptRequest :md5sum-) "e0e4e53d8b56a3ee57408d4081b2c754")
(setf (get chatgpt_connector::ChatGptRequest :datatype-) "chatgpt_connector/ChatGptRequest")
(setf (get chatgpt_connector::ChatGptRequest :definition-)
      "string prompt 
---
string response
")

(setf (get chatgpt_connector::ChatGptResponse :md5sum-) "e0e4e53d8b56a3ee57408d4081b2c754")
(setf (get chatgpt_connector::ChatGptResponse :datatype-) "chatgpt_connector/ChatGptResponse")
(setf (get chatgpt_connector::ChatGptResponse :definition-)
      "string prompt 
---
string response
")



(provide :chatgpt_connector/ChatGpt "e0e4e53d8b56a3ee57408d4081b2c754")


