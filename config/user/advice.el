;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/user/advice.el

;; TODO: linum-mode should accept a custom seperator
;; add a a space to seperate linum's from code
(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         ;; notice the space after 'd'
         (linum-format (concat "%" (number-to-string w) "d ")))
    ad-do-it))
