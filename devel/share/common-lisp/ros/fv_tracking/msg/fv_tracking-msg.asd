
(cl:in-package :asdf)

(defsystem "fv_tracking-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Diff" :depends-on ("_package_Diff"))
    (:file "_package_Diff" :depends-on ("_package"))
  ))