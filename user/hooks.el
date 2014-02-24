;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/user/hooks.el

;; delete trainling whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; elisp
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
