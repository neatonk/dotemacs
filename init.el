;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load path and user directories

(defun user-root (&optional p)
  "Resolve path relative to the user-emacs-directory."
  (concat user-emacs-directory (or p "")))

(defvar user-lib-directory (user-root "lib")
  "A directory containing user installed libs.")

(defvar user-themes-directory (user-root "themes")
  "A directory containing user installed themes.")

(defvar user-backups-directory (user-root "backups")
  "A directory used for automatic backup files.")

(defvar user-autosaves-directory (user-root "autosaves")
  "A directory used for autosave files.")

;; add to load path
(add-to-list 'load-path user-lib-directory)
(add-to-list 'load-path user-themes-directory)

(add-to-list 'custom-theme-load-path user-themes-directory)

;; put autosave files in ~/.emacs.d/autosaves/
(make-directory user-autosaves-directory t)
(setq auto-save-file-name-transforms
      `((".*" ,user-autosaves-directory t)))

;; put autosave files in ~/.emacs.d/backups/
(make-directory user-backups-directory t)
(setq backup-directory-alist
      `((".*" . ,user-backups-directory)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; libraries

(defvar required-libs
  '("auto-complete" "clojure-mode" "nrepl" "ac-nrepl" "magit" "paredit"
    "popup" "rainbow-delimiters" "smex" "sclang" "undo-tree")
  "A list of libraries required by this config.")

(defun user-lib (&optional p)
  "Resolve path relative to 'lib/'."
  (user-root (concat "lib/" (or p ""))))

;; add some libs to the load path...
(dolist (name required-libs nil)
  (add-to-list 'load-path (user-lib name)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configuration Files

(defun config-path (&optional p)
  "Resolve path relative to 'config/'."
  (user-root (concat "config/" (or p ""))))

(defun find-config (name)
  "Find and return the path to a named config if it exists.
  Otherwise nil. The given name can be a regular file, a
  directory (containing init.el), or a partial file name (to
  which '-conf.el' will be appended)."
  (let* ((p (config-path name))
        (pconf (concat p "-conf.el"))
        (pinit (concat p "/init.el")))
    (cond ((file-regular-p p)     p)
          ((file-regular-p pinit) pinit)
          ((file-regular-p pconf) pconf))))

(defun load-config (name)
  "Find a load a named config file. See 'find-config'"
  (let ((p (find-config name))) 
    (when p (load p))))

;; load any lib config files.
(dolist (name required-libs) 
  (load-config name))

;; load additional config files...
(dolist (name '("elisp" "nixos" "user")) 
  (load-config name))

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
     default))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
