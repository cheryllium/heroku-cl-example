(in-package :cl-user)

(print ">>> Building system....")
(load (make-pathname :directory *build-dir* :defaults "example.asd"))
(asdf:run-shell-command
 (format nil "cp -r ~Apublic ~A"
         (namestring (asdf:component-pathname (asdf:find-system :example)))
         (namestring (make-pathname :directory (append cl-user::*build-dir* '("public"))))
         ))



(ql:quickload :example)


;;; Copy wuwei public files to build
(wu:heroku-install-wupub-files)

(print ">>> Done building system")
