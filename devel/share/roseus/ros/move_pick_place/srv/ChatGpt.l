;; Auto-generated. Do not edit!


(when (boundp 'move_pick_place::ChatGpt)
  (if (not (find-package "MOVE_PICK_PLACE"))
    (make-package "MOVE_PICK_PLACE"))
  (shadow 'ChatGpt (find-package "MOVE_PICK_PLACE")))
(unless (find-package "MOVE_PICK_PLACE::CHATGPT")
  (make-package "MOVE_PICK_PLACE::CHATGPT"))
(unless (find-package "MOVE_PICK_PLACE::CHATGPTREQUEST")
  (make-package "MOVE_PICK_PLACE::CHATGPTREQUEST"))
(unless (find-package "MOVE_PICK_PLACE::CHATGPTRESPONSE")
  (make-package "MOVE_PICK_PLACE::CHATGPTRESPONSE"))

(in-package "ROS")





(defclass move_pick_place::ChatGptRequest
  :super ros::object
  :slots (_prompt ))

(defmethod move_pick_place::ChatGptRequest
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

(defclass move_pick_place::ChatGptResponse
  :super ros::object
  :slots (_response ))

(defmethod move_pick_place::ChatGptResponse
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

(defclass move_pick_place::ChatGpt
  :super ros::object
  :slots ())

(setf (get move_pick_place::ChatGpt :md5sum-) "e0e4e53d8b56a3ee57408d4081b2c754")
(setf (get move_pick_place::ChatGpt :datatype-) "move_pick_place/ChatGpt")
(setf (get move_pick_place::ChatGpt :request) move_pick_place::ChatGptRequest)
(setf (get move_pick_place::ChatGpt :response) move_pick_place::ChatGptResponse)

(defmethod move_pick_place::ChatGptRequest
  (:response () (instance move_pick_place::ChatGptResponse :init)))

(setf (get move_pick_place::ChatGptRequest :md5sum-) "e0e4e53d8b56a3ee57408d4081b2c754")
(setf (get move_pick_place::ChatGptRequest :datatype-) "move_pick_place/ChatGptRequest")
(setf (get move_pick_place::ChatGptRequest :definition-)
      "string prompt 
---
string response
")

(setf (get move_pick_place::ChatGptResponse :md5sum-) "e0e4e53d8b56a3ee57408d4081b2c754")
(setf (get move_pick_place::ChatGptResponse :datatype-) "move_pick_place/ChatGptResponse")
(setf (get move_pick_place::ChatGptResponse :definition-)
      "string prompt 
---
string response
")



(provide :move_pick_place/ChatGpt "e0e4e53d8b56a3ee57408d4081b2c754")


