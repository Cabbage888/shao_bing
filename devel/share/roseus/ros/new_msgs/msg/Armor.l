;; Auto-generated. Do not edit!


(when (boundp 'new_msgs::Armor)
  (if (not (find-package "NEW_MSGS"))
    (make-package "NEW_MSGS"))
  (shadow 'Armor (find-package "NEW_MSGS")))
(unless (find-package "NEW_MSGS::ARMOR")
  (make-package "NEW_MSGS::ARMOR"))

(in-package "ROS")
;;//! \htmlinclude Armor.msg.html


(defclass new_msgs::Armor
  :super ros::object
  :slots (_grade _id _x _y _z ))

(defmethod new_msgs::Armor
  (:init
   (&key
    ((:grade __grade) 0)
    ((:id __id) 0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    )
   (send-super :init)
   (setq _grade (round __grade))
   (setq _id (round __id))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   self)
  (:grade
   (&optional __grade)
   (if __grade (setq _grade __grade)) _grade)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:serialization-length
   ()
   (+
    ;; int64 _grade
    8
    ;; int64 _id
    8
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _grade
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _grade (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _grade) (= (length (_grade . bv)) 2)) ;; bignum
              (write-long (ash (elt (_grade . bv) 0) 0) s)
              (write-long (ash (elt (_grade . bv) 1) -1) s))
             ((and (class _grade) (= (length (_grade . bv)) 1)) ;; big1
              (write-long (elt (_grade . bv) 0) s)
              (write-long (if (>= _grade 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _grade s)(write-long (if (>= _grade 0) 0 #xffffffff) s)))
     ;; int64 _id
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _id (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _id) (= (length (_id . bv)) 2)) ;; bignum
              (write-long (ash (elt (_id . bv) 0) 0) s)
              (write-long (ash (elt (_id . bv) 1) -1) s))
             ((and (class _id) (= (length (_id . bv)) 1)) ;; big1
              (write-long (elt (_id . bv) 0) s)
              (write-long (if (>= _id 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _id s)(write-long (if (>= _id 0) 0 #xffffffff) s)))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _grade
#+(or :alpha :irix6 :x86_64)
      (setf _grade (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _grade (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _id
#+(or :alpha :irix6 :x86_64)
      (setf _id (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _id (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get new_msgs::Armor :md5sum-) "f01bc42540f7302c184397f596483711")
(setf (get new_msgs::Armor :datatype-) "new_msgs/Armor")
(setf (get new_msgs::Armor :definition-)
      "int64 grade
int64 id
float64 x
float64 y
float64 z
")



(provide :new_msgs/Armor "f01bc42540f7302c184397f596483711")


