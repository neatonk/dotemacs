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

;; Highlight tabs trailing, whitespace, long lines, and tab marks.
;; (global-whitespace-mode 1)
(setq-default
 whitespace-style
 '(face
   trailing
   tabs
   lines-tail
   empty
   space-after-tab
   space-before-tab))


(blink-cursor-mode 0)
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
;;(set-face-background 'show-paren-match-face "black")

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

(setq
 cperl-auto-newline nil
 cperl-close-paren-offset -4
 cperl-continued-statement-offset 4
 cperl-indent-level 4
 cperl-indent-parens-as-block t
 cperl-indent-subs-specially nil
 cperl-tab-always-indent t
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Web stuff...

;; Indentation
(let ((n 2))
  (setq js-indent-level n)
  (setq javascript-indent-level n)       ; javascript-mode
  (setq js-indent-level n)               ; js-mode
  ;; (setq web-mode-attr-indent-offset n)
  ;; (setq web-mode-attr-value-indent-offset n)
  (setq web-mode-code-indent-offset n)   ; web-mode, js code in html file
  (setq web-mode-css-indent-offset n)    ; web-mode, css in html file
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  ;;(setq web-mode-sql-indent-offset n)
  (setq css-indent-offset n))            ; css-mode


;; EOF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq magit-last-seen-setup-instructions "1.4.0")
