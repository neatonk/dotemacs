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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun lib-path (&optional p)
  "Resolve path relative to 'lib/'."
  (root-path (concat "lib/" (or p ""))))

(defun add-lib (p)
  "Add a relative lib directory to the load path"
  (add-to-load-path (lib-path p)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configuration Files

(defun config-path (&optional p)
  "Resolve path relative to 'config/'."
  (root-path (concat "config/" (or p ""))))

(defun load-config (p)
  "Load a file relative the config dir. If 'p' is a directory
  name, then 'p/init.el' will be loaded."
  (let ((p (config-path p)))
    (load (if (file-directory-p p) 
              (concat p "/init.el")
              p))))

;; load some config files...
(load-config "auto-complete-conf.el")
(load-config "clojure-conf.el")
(load-config "haskell-conf.el")
(load-config "nixos-conf.el")
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
