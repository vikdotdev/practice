;;; manual.el -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Viktor Habchak
;;
;; Author: Viktor Habchak <https://github.com/vikdotdev>
;; Maintainer: Viktor Habchak <vikdotdev@gmail.com>
;; Created: April 29, 2021
;; Modified: April 29, 2021
;; Version: 0.0.1
;; Keywords: Symbol’s value as variable is void: finder-known-keywords
;; Homepage: https://github.com/vik/manual
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;; Code examples from the Elisp manual.
;;
;;; Code:

(concat "hello number " (number-to-string 22) " cozy crows")
(+ 2 2)
(+ (* 3 (+ 1 2)) 2)
(concat "hell" "oo")
(substring "test one two" 5 10)
(*)
(+)
(message "this is my message!")
(message "The name of this buffer is: %s." (buffer-name))
(message "The value of fill-column is %d." fill-column)
(message "He saw %d %s"
         (- fill-column 32)
         (concat "red "
                 (substring
                  "The quick brown foxes jumped." 16 21)
                 " leaping."))

;; both args evaluated, that's why we use quote
(set 'flowers '(rose violet daisy buttercup))
flowers
'flowers

(set 'number (+ 25 25))
number

(set number (+ 25 35))

;; setq means set quote
;; can set multiple variables at once

(setq carnivores '(tiger lion leopard)
      omnivores '(humans))

carnivores
omnivores

(setq counter 0)                ; Let’s call this the initializer.

(setq counter (+ counter 1))    ; This is the incrementer.

(buffer-name)
(buffer-file-name)

(current-buffer)
;; Actually, by default, if the buffer from which you just switched is visible to you in another window, other-buffer will choose the most recent buffer that you cannot see; this is a subtlety that I often forget.
(other-buffer)
(switch-to-buffer (other-buffer))

;; to switch to the actual other buffer regardless of current visible buffers, use this expression
;; In this case, the first argument to other-buffer tells it which buffer to skip—the current one—and the second argument tells other-buffer it is OK to switch to a visible buffer.
(switch-to-buffer (other-buffer (current-buffer) t))

;; characters in buffer
(buffer-size)
(point)
(point-min)

(defun multiply-by-3 (n)
  "Multiplies by 3"
  (* n 3))

(multiply-by-3 3)

(mark-whole-buffer)

(defun multiply-by-4 (n)
  "Multiplies by 4"
  (interactive "p") ;; this "p" tells emacs to prefix the argument (with C-u for example)
  (message "Number %d multiplied by 4 is %d" n (* n 4)))

(multiply-by-4 3)

;; bind
(global-set-key "\C-j" 'eval-last-sexp)

;; unbind

(global-unset-key "\C-xf")

;;; Rebind 'C-x C-b' for 'buffer-menu', why \ before every C- ?
(global-set-key "\C-x\C-b" 'buffer-menu)

(message "The result is %d" (* 7 5))


(if (= 2 3)
    (message "Yes")
  (message "No"))

(equal (current-buffer) (current-buffer))
(eq (current-buffer) (current-buffer)) ;; t
(eq "test" "test") ;; nil
(string-equal "test" "test") ;; t
(string-lessp "est" "test") ;; t

(eq (current-buffer) (current-buffer))

(defun double (n)
  (interactive "p")
  (message "%d" (* n 2)))

(double 2)

(defun greater-than-fill-column (n)
  (if (> fill-column n)
      (message "Fill column value of %d is greater than %d"
	       fill-column n)
    (message "Fill column value of %d is less than %d"
	     fill-column n)))


(greater-than-fill-column 75)
