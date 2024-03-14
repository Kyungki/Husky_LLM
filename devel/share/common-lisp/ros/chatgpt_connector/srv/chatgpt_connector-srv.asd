
(cl:in-package :asdf)

(defsystem "chatgpt_connector-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ChatGpt" :depends-on ("_package_ChatGpt"))
    (:file "_package_ChatGpt" :depends-on ("_package"))
  ))