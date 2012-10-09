;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/user/init.el

(load-config "user/bindings.el")

;; disable *-bar-modes
(menu-bar-mode -1)
(if (display-graphic-p)
    (progn 
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

;; no beep...
(setq visible-bell t)

;; no splash screen...
(setq inhibit-splash-screen t)

;; by the numbers...
(linum-mode 1)
(line-number-mode 1)
(column-number-mode 1)

;; syntax highlighting
(global-font-lock-mode)

;; highlight parens
(show-paren-mode 1)
(set-face-background 'show-paren-match-face "black")

;; no tabs by default...
(setq-default indent-tabs-mode nil)

;; Use Emacs 24 color themes
(load-theme 'zenburn t)
;;(load-theme 'solarized-dark t)

;; use aspell for spelling...
(setq ispell-program-name "aspell")
(setq ispell-list-command "list")
;; for speed... normal, fast, ultra
(setq ispell-extra-args '("--sug-mode=fast"))

;; delete trainling whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)
