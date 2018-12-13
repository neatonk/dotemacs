;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load path and user directories


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defun user-root (&optional p)
  "Resolve path relative to the user-emacs-directory."
  (concat user-emacs-directory (or p "")))

(defun user-path (&optional p)
  "Resolve path relative to 'user/'."
  (user-root (concat "user/" (or p ""))))

(defun user-load (name)
  "Find and load a user file relative."
  (load (user-path name)))

(defvar user-themes-directory (user-root "themes")
  "A directory containing user installed themes.")

(defvar user-backups-directory (user-root "backups")
  "A directory used for automatic backup files.")

(defvar user-autosaves-directory (user-root "autosaves/")
  "A directory used for autosave files.")

;; add themes to load path
(add-to-list 'load-path user-themes-directory)
(add-to-list 'custom-theme-load-path user-themes-directory)

;; put autosave files in ~/.emacs.d/autosaves/
(make-directory user-autosaves-directory t)
(setq auto-save-file-name-transforms
      `((".*" ,user-autosaves-directory t)))
(setq tramp-auto-save-directory
      user-autosaves-directory)

;; put autosave files in ~/.emacs.d/backups/
(make-directory user-backups-directory t)
(setq backup-directory-alist
      `((".*" . ,user-backups-directory)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; el-get

(defvar user-el-get-directory (user-root "el-get"))
(defvar user-el-get-lib-directory (user-root "el-get/el-get"))

(add-to-list 'load-path user-el-get-lib-directory)

(catch 'missing-el-get
  (unless (require 'el-get nil 'noerror)
    (if (y-or-n-p "Missing el-get. Install it now?")
        (with-current-buffer
            (url-retrieve-synchronously
             "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
          (goto-char (point-max))
          (eval-print-last-sexp))
      (throw 'missing-el-get)))

  (add-to-list 'el-get-recipe-path (user-path "el-get/recipes"))
  (setq el-get-user-package-directory (user-path "el-get"))

  (setq user-el-get-packages ; sclang tt-mode undo-tree
        '(ac-cider
          auto-complete
          clojure-mode
          cperl-mode
          dockerfile-mode
          el-get
          git-modes
          js2-mode
          magit
          markdown-mode
          nginx-mode
          paredit
          popup
          rainbow-delimiters
          rust-mode
          scss-mode
          smex
          toml-mode
          web-mode
          xcscope
          yaml-mode
          ))

  ;; Install selected packages from github
  (el-get-bundle cider :checkout "v0.10.2")

  (el-get-bundle vcl-mode
    :url "https://raw.githubusercontent.com/ssm/vcl-mode/master/vcl-mode.el")

  (el-get-bundle scad-mode
    :url "https://raw.githubusercontent.com/openscad/openscad/openscad-2015.03/contrib/scad-mode.el")

  (el-get-bundle martinscz/xc-mode)

  (setq tt-mode-hook nil)
  (el-get-bundle davorg/tt-mode)

  ;; Synchronously install selected packages
  (el-get 'sync user-el-get-packages))


;; always load user init file
(user-load "init.el")

;;
;; End of init.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("7b4a6cbd00303fc53c2d486dfdbe76543e1491118eba6adc349205dbf0f7063a"
     "d2622a2a2966905a5237b54f35996ca6fda2f79a9253d44793cfe31079e3c92b"
     default)))
 '(package-selected-packages (quote (queue)))
 '(scss-compile-at-save nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'set-goal-column 'disabled nil)
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
