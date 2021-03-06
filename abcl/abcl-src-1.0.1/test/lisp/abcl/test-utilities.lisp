;;; test-utilities.lisp
;;;
;;; Copyright (C) 2005-2006 Peter Graves
;;; $Id: test-utilities.lisp 13057 2010-11-27 11:03:58Z mevenson $
;;;
;;; This program is free software; you can redistribute it and/or
;;; modify it under the terms of the GNU General Public License
;;; as published by the Free Software Foundation; either version 2
;;; of the License, or (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program; if not, write to the Free Software
;;; Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

#+(and allegro mswindows)
(pushnew :windows *features*)
#+(and clisp win32)
(pushnew :windows *features*)
#+(and lispworks win32)
(pushnew :windows *features*)

(in-package #:abcl-regression-test)

(defmacro signals-error (form error-name)
  `(locally (declare (optimize safety))
     (handler-case ,form
       (condition (c) (typep c ,error-name))
       (:no-error (&rest ignored) (declare (ignore ignored)) nil))))
(export '(signals-error))

#+nil (rem-all-tests)

#+nil (setf *expected-failures* nil)

