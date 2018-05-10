
(cl:in-package :asdf)

(defsystem "kinect2_viewer-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "PointCloud" :depends-on ("_package_PointCloud"))
    (:file "_package_PointCloud" :depends-on ("_package"))
  ))