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

(defun file-string (path)
  (with-open-file (stream path)
    (let ((data (make-string (file-length stream))))
      (read-sequence data stream)
      data)))

;;; Called at application initialization time.
(defun cl-user::initialize-application ()
  ;; This has to be done at app-init rather than app-build time, to point to right directory.

  ;; Publish static files. 
  (publish-directory
   :prefix "/"
   :destination (namestring (truename "./public/")))

  ;; Publish web pages. 
  (mapcar #'(lambda (page) 
	      (publish :path (car page) 
		       :function (base-page (file-string 
					     (namestring (truename (cdr page))))))) 
	  (list 
	   (cons "/" "./templates/index.html")))


  (wu:wuwei-initialize-application))





		   



