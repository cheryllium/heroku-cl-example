(in-package :net.aserve)

(defun base-page (body) 
  #'(lambda (req ent) 
      (with-http-response
       (req ent) 
       (with-http-body
	(req ent)
	(format 
	 (request-reply-stream req)
	 "~a" 
	 "test")))))



(publish :path "/"
	 :function (base-page "hello world"))

;;; Called at application initialization time.
(defun cl-user::initialize-application ()
  ;; This has to be done at app-init rather than app-build time, to point to right directory.
  (publish-directory
   :prefix "/"
   :destination (namestring (truename "./public/")))
  (wu:wuwei-initialize-application))





		   



