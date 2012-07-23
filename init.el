;;;;;;;;;;;;;;;;;;;;;
;; Personalization ;;
;;;;;;;;;;;;;;;;;;;;;

(global-font-lock-mode)

;; Don't use tabs by default
(setq-default indent-tabs-mode nil)

;;;;;;;;;;;;;;;;;;;;
;; NixOS Settings ;;
;;;;;;;;;;;;;;;;;;;;

;; Fix load-path in NixOs
(setq load-path (append (list "~/.nix-profile/share/emacs/site-lisp" 
			      "/var/run/current-system/sw/share/emacs/site-lisp") 
			load-path))

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
(add-to-list 'load-path "lib/slime")
(require 'slime)
(eval-after-load 'slime '(setq slime-protocol-version 'ignore))
(slime-setup '(slime-repl))

;; Load a major mode for editing Clojure code.
(add-to-list 'load-path "lib/clojure-mode")
(require 'clojure-mode)
(require 'clojure-test-mode) ;; requires slime

;; Add paredit hook
(require 'paredit)
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)
