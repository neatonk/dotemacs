;;;;;;;;;;;;;;;;;;;;;
;; Personalization ;;
;;;;;;;;;;;;;;;;;;;;;

;; add lib and themes to load-path...
(add-to-list 'load-path "~/.emacs.d/lib")
(add-to-list 'load-path "~/.emacs.d/themes")

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
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)
;;(load-theme 'solarized-dark t)


;;;;;;;;;;;;;;;;;;;;
;; NixOS Settings ;;
;;;;;;;;;;;;;;;;;;;;

;; Fix load-path in NixOs
(add-to-list 'load-path "~/.nix-profile/share/emacs/site-lisp" )
(add-to-list 'load-path "/var/run/current-system/sw/share/emacs/site-lisp")

;; Fix tramp in NixOS
(require 'tramp)
(add-to-list 'tramp-remote-path "/var/run/current-system/sw/bin")

;; Enable nix mode
(setq auto-mode-alist (append '(("\\.nix$" . nix-mode)) auto-mode-alist))
(autoload 'nix-mode "nix-mode" "nix mode" t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Clojure slime/swank-clojure ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Load and configure SLIME
(add-to-list 'load-path "~/.emacs.d/lib/slime")
(require 'slime)
(eval-after-load 'slime '(setq slime-protocol-version 'ignore))
(slime-setup '(slime-repl))

;; Load a major mode for editing Clojure code.
(add-to-list 'load-path "~/.emacs.d/lib/clojure-mode")
(require 'clojure-mode)
(require 'clojure-test-mode) ;; requires slime

;; Add paredit hook
(add-to-list 'load-path "~/.emacs.d/lib/paredit")
(require 'paredit)
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)

;;;;;;;;;;;;;;;;;;
;; Haskell Mode ;;
;;;;;;;;;;;;;;;;;;

(load "~/.emacs.d/lib/haskell-mode/haskell-site-file.el")

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)

;; init.el ends here...
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
