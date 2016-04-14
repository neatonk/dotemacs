;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load path and user directories

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

(defvar user-autosaves-directory (user-root "autosaves")
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
          cider
          el-get
          git-modes
          magit
          markdown-mode
          nginx-mode
          paredit
          popup
          rainbow-delimiters
          scss-mode
          smex
          tuareg-mode ; OCaml
          yaml-mode
          ))

  ;; Install selected packages from github
  (el-get-bundle vcl-mode
    :url "https://raw.githubusercontent.com/ssm/elisp/master/vcl-mode.el")

  (el-get-bundle martinscz/xc-mode)

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
 '(scss-compile-at-save nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
