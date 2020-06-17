;; Auto-generated. Do not edit!


(when (boundp 'fv_tracking::Diff)
  (if (not (find-package "FV_TRACKING"))
    (make-package "FV_TRACKING"))
  (shadow 'Diff (find-package "FV_TRACKING")))
(unless (find-package "FV_TRACKING::DIFF")
  (make-package "FV_TRACKING::DIFF"))

(in-package "ROS")
;;//! \htmlinclude Diff.msg.html


(defclass fv_tracking::Diff
  :super ros::object
  :slots (_x _y _velx _vely _Ix _Iy _recsize _selectrec ))

(defmethod fv_tracking::Diff
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:velx __velx) 0.0)
    ((:vely __vely) 0.0)
    ((:Ix __Ix) 0.0)
    ((:Iy __Iy) 0.0)
    ((:recsize __recsize) 0.0)
    ((:selectrec __selectrec) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _velx (float __velx))
   (setq _vely (float __vely))
   (setq _Ix (float __Ix))
   (setq _Iy (float __Iy))
   (setq _recsize (float __recsize))
   (setq _selectrec (float __selectrec))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:velx
   (&optional __velx)
   (if __velx (setq _velx __velx)) _velx)
  (:vely
   (&optional __vely)
   (if __vely (setq _vely __vely)) _vely)
  (:Ix
   (&optional __Ix)
   (if __Ix (setq _Ix __Ix)) _Ix)
  (:Iy
   (&optional __Iy)
   (if __Iy (setq _Iy __Iy)) _Iy)
  (:recsize
   (&optional __recsize)
   (if __recsize (setq _recsize __recsize)) _recsize)
  (:selectrec
   (&optional __selectrec)
   (if __selectrec (setq _selectrec __selectrec)) _selectrec)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _velx
    8
    ;; float64 _vely
    8
    ;; float64 _Ix
    8
    ;; float64 _Iy
    8
    ;; float64 _recsize
    8
    ;; float64 _selectrec
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velx
       (sys::poke _velx (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vely
       (sys::poke _vely (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Ix
       (sys::poke _Ix (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Iy
       (sys::poke _Iy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _recsize
       (sys::poke _recsize (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _selectrec
       (sys::poke _selectrec (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velx
     (setq _velx (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vely
     (setq _vely (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Ix
     (setq _Ix (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Iy
     (setq _Iy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _recsize
     (setq _recsize (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _selectrec
     (setq _selectrec (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get fv_tracking::Diff :md5sum-) "555a2165453dfd975e2db54640de2933")
(setf (get fv_tracking::Diff :datatype-) "fv_tracking/Diff")
(setf (get fv_tracking::Diff :definition-)
      "float64 x  #pix
float64 y
float64 velx
float64 vely
float64 Ix
float64 Iy
float64 recsize	#框选近大远小
float64 selectrec	#框选大小

")



(provide :fv_tracking/Diff "555a2165453dfd975e2db54640de2933")


