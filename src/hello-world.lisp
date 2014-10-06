(in-package :net.aserve)

(defparameter *header* "<h1>Header</h1>")
(defparameter *footer* "<h1>Footer</h1>")

(defun base-page (body) 
  #'(lambda (req ent) 
      (with-http-response
       (req ent) 
       (with-http-body
	(req ent)
	(format 
	 (request-reply-stream req)
	 "~a~a~a" *header* body *footer*)))))




;;; Called at application initialization time.
(defun cl-user::initialize-application ()
  ;; This has to be done at app-init rather than app-build time, to point to right directory.
  (publish-directory
   :prefix "/"
   :destination (namestring (truename "./public/")))

  (publish :path "/"
	   :function (base-page "hello world"))

  (wu:wuwei-initialize-application))





		   



