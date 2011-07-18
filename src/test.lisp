; -*- mode: lisp -*-

;; :NOTE This moved from :FILE src/fsdb.lisp
(defun rwlock-test (&optional (iterations 3) (readers 5))
  (let ((stop nil)
        (lock (make-read-write-lock))
        (stream *standard-output*))
    (dotimes (i readers)
      (process-run-function
       (format nil "Reader ~s" i)
       (lambda (cnt)
         (loop
            (with-read-locked-rwlock (lock)
              (format stream "Start reader ~s~%" cnt)
              (sleep 0.5)
              (format stream "Stop reader ~s~%" cnt))
            (when stop (return))))
       i))
    (unwind-protect
         (dotimes (i iterations)
           (sleep 0.1)
           (with-read-locked-rwlock (lock)
             (with-write-locked-rwlock (lock t)
               (format t "Start writer~%")
               (sleep 0.1)
               (format t "Stop writer~%"))))
      (setf stop t))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Copyright 2009-2010 Bill St. Clair
;;;
;;; Licensed under the Apache License, Version 2.0 (the "License");
;;; you may not use this file except in compliance with the License.
;;; You may obtain a copy of the License at
;;;
;;;     http://www.apache.org/licenses/LICENSE-2.0
;;;
;;; Unless required by applicable law or agreed to in writing, software
;;; distributed under the License is distributed on an "AS IS" BASIS,
;;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;;; See the License for the specific language governing permissions
;;; and limitations under the License.
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
