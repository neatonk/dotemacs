;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/magit-conf.el

;;(require 'magit)
(autoload 'magit-status "magit" nil t)
(global-set-key (kbd "C-x m") 'magit-status)

