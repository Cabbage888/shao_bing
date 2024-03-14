
(cl:in-package :asdf)

(defsystem "new_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Armor" :depends-on ("_package_Armor"))
    (:file "_package_Armor" :depends-on ("_package"))
    (:file "barrel" :depends-on ("_package_barrel"))
    (:file "_package_barrel" :depends-on ("_package"))
    (:file "chassis" :depends-on ("_package_chassis"))
    (:file "_package_chassis" :depends-on ("_package"))
    (:file "vector_Armor" :depends-on ("_package_vector_Armor"))
    (:file "_package_vector_Armor" :depends-on ("_package"))
  ))