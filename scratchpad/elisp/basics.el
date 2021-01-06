;;; package --- Summary
;;;
;;; Code:
(+ 2 1)

(concat "a" "b")
(defun myfunc (x y)
  "Function documentation. (X Y)."
  (* x y))
(myfunc 3 4)

(defvar myvar 1 "Variable docs.")
myvar
(defvar anothervar (concat myvar "!")
  "Concat try.")
anothervar


(let ((x 1)
      (y 2)))

;;; this
(progn (+ 1 0)(+ 2 2))
;;; and this returs different results??
(progn (+ 1 0)
  (+ 2 2))

(progn 1 2 3)

(setq var-name 15)
(+ var-name 2)
(eq major-mode 'emacs-lisp-mode)
(eq major-mode 'ruby-mode)
(= 0 1)
(= 1 1)
(string= "a" "b")
(string= "a" "a")
(string> "a" "b")

(string> "b" "a")

(current-buffer)

(with-current-buffer "*Messages*"
  (current-buffer))

(set-buffer "*Messages*")
(switch-to-buffer "*Messages*")
;; (save-current-buffer)


(defun append-to-buffer (buffer start end)
  "Append the text of the region to BUFFER."
  (interactive "BAppend to buffer: \nr")
  (let ((oldbuf (current-buffer)))
    (save-current-buffer
      (set-buffer (get-buffer-create buffer))
      (insert-buffer-substring oldbuf start end))))
(append-to-buffer "*scratch*" 1023 1064)
(narrow-to-region 1023 1064) ;; remove all the text but the region

(goto-char (point-min))

(goto-char (- (point) 5))
foo
foo
bar
(replace-string "foo" "bar")
(save-excursion
  (goto-char 1)
        (forward-line 2)
        (narrow-to-region 1 (point))
        (goto-char (point-min))
        (replace-string "foo" "bar"))
;; (pop-to-buffer)
(setq myvar major-mode)
(myvar)
(defvar my-var nil
  "My var")
(point)
(point-max)
(point-min)
(my-var)


(defun print-upper-region ()
  "Demo to print the uppercased wish of the active region."
  (interactive)
  (when (region-active-p)
    (insert (let ((string (buffer-substring (region-beginning)
                                                  (region-end))))
                    (with-temp-buffer
                      (insert string)
                      (upcase-region (point-min)
                                     (point-max))
                      (buffer-substring-no-properties (point-min)
                                                      (point-max)))))))
(print-upper-region)
print{}
(provide 'basics)
;;; basics.el ends here
