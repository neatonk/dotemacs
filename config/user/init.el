;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/user/init.el

(load-config "user/bindings.el")
(load-config "user/functions.el")
(load-config "user/advice.el")
(load-config "user/hooks.el")

(setq-default fill-column 80
              indent-tabs-mode nil)

(global-linum-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(global-font-lock-mode 1)
(show-paren-mode 1)

(setq visible-bell t
      inhibit-splash-screen t
      ;; better scrolling
      scroll-margin 5
      scroll-conservatively 100000
      ;; use aspell for spelling...
      ispell-program-name "aspell"
      ispell-list-command "list"
      ;; for speed... normal, fast, ultra
      ispell-extra-args '("--sug-mode=fast"))

;; Use Emacs 24 color themes
(load-theme 'zenburn t)
(set-face-background 'show-paren-match-face "black")

;; disable *-bar-modes
(menu-bar-mode -1)
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

;; use GnuPG1 in text terminals
(when (not (display-graphic-p))
  (setq epg-gpg-program "/usr/local/bin/gpg"))

;; prefer cperl-mode and use tabs to play nice...
(mapc
 (lambda (pair)
   (if (eq (cdr pair) 'perl-mode)
       (setcdr pair 'cperl-mode)))
 (append auto-mode-alist interpreter-mode-alist))

(defun legacy-tabs-mode ()
  (set (make-local-variable 'tab-width) 4)
  (set (make-local-variable 'indent-tabs-mode) true))

(add-hook 'cperl-mode-hook legacy-tabs-mode)
