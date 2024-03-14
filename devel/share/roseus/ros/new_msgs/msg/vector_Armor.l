;; Auto-generated. Do not edit!


(when (boundp 'new_msgs::vector_Armor)
  (if (not (find-package "NEW_MSGS"))
    (make-package "NEW_MSGS"))
  (shadow 'vector_Armor (find-package "NEW_MSGS")))
(unless (find-package "NEW_MSGS::VECTOR_ARMOR")
  (make-package "NEW_MSGS::VECTOR_ARMOR"))

(in-package "ROS")
;;//! \htmlinclude vector_Armor.msg.html


(defclass new_msgs::vector_Armor
  :super ros::object
  :slots (_grade _id _x _y _z ))

(defmethod new_msgs::vector_Armor
  (:init
   (&key
    ((:grade __grade) (make-array 0 :initial-element 0 :element-type :integer))
    ((:id __id) (make-array 0 :initial-element 0 :element-type :integer))
    ((:x __x) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:y __y) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:z __z) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _grade __grade)
   (setq _id __id)
   (setq _x __x)
   (setq _y __y)
   (setq _z __z)
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
    ;; int64[] _grade
    (* 8    (length _grade)) 4
    ;; int64[] _id
    (* 8    (length _id)) 4
    ;; float64[] _x
    (* 8    (length _x)) 4
    ;; float64[] _y
    (* 8    (length _y)) 4
    ;; float64[] _z
    (* 8    (length _z)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64[] _grade
     (write-long (length _grade) s)
     (dotimes (i (length _grade))
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _grade i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _grade i)) (= (length ((elt _grade i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _grade i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _grade i) . bv) 1) -1) s))
             ((and (class (elt _grade i)) (= (length ((elt _grade i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _grade i) . bv) 0) s)
              (write-long (if (>= (elt _grade i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _grade i) s)(write-long (if (>= (elt _grade i) 0) 0 #xffffffff) s)))
       )
     ;; int64[] _id
     (write-long (length _id) s)
     (dotimes (i (length _id))
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _id i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _id i)) (= (length ((elt _id i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _id i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _id i) . bv) 1) -1) s))
             ((and (class (elt _id i)) (= (length ((elt _id i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _id i) . bv) 0) s)
              (write-long (if (>= (elt _id i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _id i) s)(write-long (if (>= (elt _id i) 0) 0 #xffffffff) s)))
       )
     ;; float64[] _x
     (write-long (length _x) s)
     (dotimes (i (length _x))
       (sys::poke (elt _x i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _y
     (write-long (length _y) s)
     (dotimes (i (length _y))
       (sys::poke (elt _y i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _z
     (write-long (length _z) s)
     (dotimes (i (length _z))
       (sys::poke (elt _z i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64[] _grade
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _grade (instantiate integer-vector n))
     (dotimes (i n)
#+(or :alpha :irix6 :x86_64)
      (setf (elt _grade i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _grade i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     ))
   ;; int64[] _id
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _id (instantiate integer-vector n))
     (dotimes (i n)
#+(or :alpha :irix6 :x86_64)
      (setf (elt _id i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _id i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     ))
   ;; float64[] _x
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _x (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _x i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _y
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _y (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _y i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _z
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _z (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _z i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get new_msgs::vector_Armor :md5sum-) "cf7c5ccb1a8c18d9d98118393187f319")
(setf (get new_msgs::vector_Armor :datatype-) "new_msgs/vector_Armor")
(setf (get new_msgs::vector_Armor :definition-)
      "int64[] grade
int64[] id
float64[] x
float64[] y
float64[] z
")



(provide :new_msgs/vector_Armor "cf7c5ccb1a8c18d9d98118393187f319")


