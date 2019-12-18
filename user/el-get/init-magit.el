;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/magit-conf.el

(defun my-magit-status ()
  (interactive)
  (require 'magit)
  (if-let ((buf (magit-get-mode-buffer 'magit-status-mode)))
      (progn (switch-to-buffer buf)
             (magit-refresh-buffer))
    (magit-status)))

(global-set-key (kbd "C-x m") 'my-magit-status)
