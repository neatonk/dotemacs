;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/user/init.el

(user-load "bindings.el")
(user-load "functions.el")
(user-load "advice.el")
(user-load "hooks.el")

(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default fill-column 80
              indent-tabs-mode nil
              tab-width 4)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; perl stuff...

;; prefer cperl-mode and use tabs to play nice...
(mapc
 (lambda (pair)
   (if (eq (cdr pair) 'perl-mode)
       (setcdr pair 'cperl-mode)))
 (append auto-mode-alist interpreter-mode-alist))

(defun legacy-tabs-mode ()
  (set (make-local-variable 'tab-width) 4)
  (set (make-local-variable 'indent-tabs-mode) t))

(add-hook 'cperl-mode-hook 'legacy-tabs-mode)

(setq cperl-indent-level 4
      cperl-close-paren-offset -4
      cperl-continued-statement-offset 4
      cperl-indent-parens-as-block t
      cperl-tab-always-indent t)
