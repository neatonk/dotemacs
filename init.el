;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load Path

(defun add-to-load-path (p)
  "Add 'p' to the load-path."
  (add-to-list 'load-path p))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun root-path (&optional p)
  "Resolve path relative to the user-emacs-directory."
  (concat user-emacs-directory (or p "")))

(defun add-root (p)
  "Add a relative directory to the load path."
  (add-to-load-path (root-path p)))

;; add some root dirs to the load path...
(add-root "lib")    ;; submodules live here.
(add-root "themes") ;; for dynamic themes like solarized.el

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun lib-path (&optional p)
  "Resolve path relative to 'lib/'."
  (root-path (concat "lib/" (or p ""))))

(defun add-lib (p)
  "Add a relative lib directory to the load path"
  (add-to-load-path (lib-path p)))

;; add some libs to the load path...
(add-lib "auto-complete")
(add-lib "clojure-mode")
(add-lib "haskell-mode")
(add-lib "paredit")
(add-lib "popup")
(add-lib "slime")
(add-lib "smex")
(add-lib "undo-tree")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configuration Files

(defun config-path (&optional p)
  "Resolve path relative to 'config/'."
  (root-path (concat "config/" (or p ""))))

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

;; load some config files...
(load-config "auto-complete")
(load-config "clojure")
(load-config "elisp")
(load-config "haskell")
(load-config "nixos")
(load-config "undo-tree")
(load-config "smex")
(load-config "user")

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
