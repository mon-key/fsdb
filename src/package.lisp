; -*- mode: lisp -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; FSDB package definition
;;;

(in-package :cl-user)

(cl:defpackage :fsdb
  (:use :cl)
  (:export
   ;; file-locks.lisp
   #:file-lock
   #:grab-file-lock
   #:with-lock-grabbed
   #:make-lock
   #:release-file-lock
   #:with-file-locked
   #:make-semaphore
   #:signal-semaphore
   #:wait-on-semaphore
   ;;
   ;; fsdb.lisp
   #:db
   #:make-fsdb
   #:fsdb
   #:db-put
   #:db-get
   #:with-db-lock
   #:db-lock
   #:db-unlock
   #:db-contents
   #:db-subdir
   #:db-dir-p
   #:append-db-keys
   #:%append-db-keys
   #:with-fsdb-filename
   #:with-read-locked-fsdb
   #:with-write-locked-fsdb
   #:db-wrapper
   #:make-db-wrapper
   #:db-wrapper-db
   #:db-wrapper-get
   #:db-wrapper-contents
   #:commit-db-wrapper
   #:rollback-db-wrapper
   #:with-db-wrapper
   #:copy-db-wrapper

   ;; :NOTE Bill St. Clair's FSDB exports the symbols below but we don't need
   ;; them and they're likely to cause symbol clashes at some point so we leave
   ;; them commented out for the time being.

   ;; utility.lisp
   ;; #:make-equal-hash
   ;; #:*whitespace*
   ;; #:strcat
   ;; #:remove-trailing-separator
   ;; #:blankp
   ;; #:stringify
   ;; #:trim
   ;; #:file-get-contents
   ;; #:file-put-contents
   ;; #:dotcat
   ;; #:assocequal
   ;; #:str-replace
   ;; #:strstr
   ;; #:explode
   ;; #:implode
   ;; ;;;;;; #:get-inited-hash
   ;; #:delq

   ;; ccl.lisp & sbcl.lisp
   ;; #:ensure-directory-pathname
   ;; #:recursive-delete-directory
   ;; #:process-wait
   ;; #:process-run-function
   ;; #:current-process
   ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Copyright 2011 Bill St. Clair
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
