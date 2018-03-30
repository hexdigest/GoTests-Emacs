;;; gounit.el --- Emacs package for https://github.com/hexdigest/gounit 

;; Copyright (C) 2016  Damien Levin

;; Author: Damien Levin
;; Keywords: go test gounit languages 
;; Version: 0.0.2
;; URL: https://github.com/hexdigest/GoUnit-Emacs/blob/master/gounit.el

;; Apache License (version 2.0).

;;; Code:

(defconst func-regexp "\\_<\\(func\\s-([^\)]*\)\s\\(\\w*\\)\\|func\\s-\\(\\w*\\)\\)\\_>")

;; Return all go functions found in the selected region.
(defun go-functions (string)
  (save-match-data
    (let ((pos 0) functions)
      (while (string-match func-regexp string pos)
        (let ((f (match-string 2 string))
          (g (match-string 3 string)))
          (cond
           ((not(null f))(push f functions))
           ((not(null g))(push g functions))))
        (setq pos (match-end 0)))
      functions)))

;; Execute `gen` if we are not in a test file.
(defun gen-if-not-test(gen)
  (if (string-match "_test.go\\'" buffer-file-name)
    (message "Cannot generate gounit from test file.")
  (funcall gen)))

;; Generate all missing go tests.
(defun gounit()
  (interactive)
  (gen-if-not-test 
   (lambda() (call-process "gounit" nil nil nil "-all" "-i" buffer-file-name))))

;; Generate all missing go tests in region.
(defun gounit-region()
  (interactive)
  (gen-if-not-test 
   (lambda() (call-process "gounit" nil nil nil "-i" buffer-file-name "-f" (mapconcat 'identity (go-functions (buffer-substring (region-beginning) (region-end))) ",") ))))

(provide 'gounit)
;;; gounit.el ends here
