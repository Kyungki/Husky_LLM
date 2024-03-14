
(cl:in-package :asdf)

(defsystem "move_pick_place-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ChatGpt" :depends-on ("_package_ChatGpt"))
    (:file "_package_ChatGpt" :depends-on ("_package"))
  ))