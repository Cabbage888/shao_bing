;; Auto-generated. Do not edit!


(when (boundp 'new_msgs::huang)
  (if (not (find-package "NEW_MSGS"))
    (make-package "NEW_MSGS"))
  (shadow 'huang (find-package "NEW_MSGS")))
(unless (find-package "NEW_MSGS::HUANG")
  (make-package "NEW_MSGS::HUANG"))

(in-package "ROS")
;;//! \htmlinclude huang.msg.html


(defclass new_msgs::huang
  :super ros::object
  :slots (_num _id _grade _yaw _x _y _z ))

(defmethod new_msgs::huang
  (:init
   (&key
    ((:num __num) 0)
    ((:id __id) (make-array 0 :initial-element 0 :element-type :integer))
    ((:grade __grade) (make-array 0 :initial-element 0 :element-type :integer))
    ((:yaw __yaw) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:x __x) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:y __y) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:z __z) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _num (round __num))
   (setq _id __id)
   (setq _grade __grade)
   (setq _yaw __yaw)
   (setq _x __x)
   (setq _y __y)
   (setq _z __z)
   self)
  (:num
   (&optional __num)
   (if __num (setq _num __num)) _num)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:grade
   (&optional __grade)
   (if __grade (setq _grade __grade)) _grade)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
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
    ;; int8 _num
    1
    ;; int8[] _id
    (* 1    (length _id)) 4
    ;; int32[] _grade
    (* 4    (length _grade)) 4
    ;; float32[] _yaw
    (* 4    (length _yaw)) 4
    ;; float32[] _x
    (* 4    (length _x)) 4
    ;; float32[] _y
    (* 4    (length _y)) 4
    ;; float32[] _z
    (* 4    (length _z)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _num
       (write-byte _num s)
     ;; int8[] _id
     (write-long (length _id) s)
     (dotimes (i (length _id))
       (write-byte (elt _id i) s)
       )
     ;; int32[] _grade
     (write-long (length _grade) s)
     (dotimes (i (length _grade))
       (write-long (elt _grade i) s)
       )
     ;; float32[] _yaw
     (write-long (length _yaw) s)
     (dotimes (i (length _yaw))
       (sys::poke (elt _yaw i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _x
     (write-long (length _x) s)
     (dotimes (i (length _x))
       (sys::poke (elt _x i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _y
     (write-long (length _y) s)
     (dotimes (i (length _y))
       (sys::poke (elt _y i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _z
     (write-long (length _z) s)
     (dotimes (i (length _z))
       (sys::poke (elt _z i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _num
     (setq _num (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _num 127) (setq _num (- _num 256)))
   ;; int8[] _id
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _id (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _id i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _id i) 127) (setf (elt _id i) (- (elt _id i) 256)))
     ))
   ;; int32[] _grade
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _grade (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _grade i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; float32[] _yaw
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _yaw (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _yaw i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _x
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _x (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _x i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _y
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _y (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _y i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _z
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _z (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _z i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get new_msgs::huang :md5sum-) "46fb889fe7931e25e4f6c75cb36330e9")
(setf (get new_msgs::huang :datatype-) "new_msgs/huang")
(setf (get new_msgs::huang :definition-)
      "int8 num
int8[] id
int32[] grade
float32[] yaw
float32[] x
float32[] y
float32[] z

")



(provide :new_msgs/huang "46fb889fe7931e25e4f6c75cb36330e9")


