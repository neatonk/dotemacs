;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/magit-conf.el

;;(require 'magit)

(defun my-magit-status ()
  (interactive)
  (if-let ((buf (magit-get-mode-buffer 'magit-status-mode)))
      (progn (switch-to-buffer buf)
             (magit-refresh-buffer))
    (magit-status)))

(autoload 'magit-status "magit" nil t)
(global-set-key (kbd "C-x m") 'my-magit-status)
