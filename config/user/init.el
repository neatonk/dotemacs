;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/user/init.el

(load-config "user/bindings.el")

;; save space...
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; no beep...
(setq visible-bell t)

;; no splash screen...
(setq inhibit-splash-screen t)

;; by the numbers...
(linum-mode 1)
(line-number-mode 1)
(column-number-mode 1)

(global-font-lock-mode)

;; no tabs by default...
(setq-default indent-tabs-mode nil)

;; Use Emacs 24 color themes
(add-to-list 'custom-theme-load-path (root-path "themes"))
(load-theme 'zenburn t)
;;(load-theme 'solarized-dark t)


