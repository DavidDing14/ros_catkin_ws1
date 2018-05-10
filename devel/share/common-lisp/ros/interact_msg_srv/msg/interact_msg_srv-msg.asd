
(cl:in-package :asdf)

(defsystem "interact_msg_srv-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "OrderList" :depends-on ("_package_OrderList"))
    (:file "_package_OrderList" :depends-on ("_package"))
    (:file "Order" :depends-on ("_package_Order"))
    (:file "_package_Order" :depends-on ("_package"))
    (:file "NotifyGesture" :depends-on ("_package_NotifyGesture"))
    (:file "_package_NotifyGesture" :depends-on ("_package"))
    (:file "AsrResultMsg" :depends-on ("_package_AsrResultMsg"))
    (:file "_package_AsrResultMsg" :depends-on ("_package"))
    (:file "PointDirection" :depends-on ("_package_PointDirection"))
    (:file "_package_PointDirection" :depends-on ("_package"))
  ))