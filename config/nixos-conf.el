;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/nixos-conf.el

;; Fix load-path in NixOs
(add-to-list 'load-path "~/.nix-profile/share/emacs/site-lisp")
(add-to-list 'load-path "/var/run/current-system/sw/share/emacs/site-lisp")

;; Fix tramp in NixOS
(require 'tramp)
(add-to-list 'tramp-remote-path "/var/run/current-system/sw/bin")

;; Enable nix mode
(setq auto-mode-alist (append '(("\\.nix$" . nix-mode)) auto-mode-alist))
(autoload 'nix-mode "nix-mode" "nix mode" t)
