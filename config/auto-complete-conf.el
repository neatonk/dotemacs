;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/auto-complete-conf.el

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories 
             (lib-path "auto-complete/dict"))

(global-auto-complete-mode t)
(setq ac-auto-show-menu t)
(setq ac-dwim t)
(setq ac-quick-help-delay 1)
(setq ac-quick-help-height 60)
(setq ac-use-menu-map t)

(set-default 'ac-sources 
             '(ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-words-in-all-buffer
               ac-source-semantic))

(dolist (mode '(magit-log-edit-mode
                log-edit-mode
                org-mode
                text-mode
                haml-mode
                sass-mode 
                yaml-mode
                csv-mode
                espresso-mode
                haskell-mode
                html-mode
                nxml-mode
                sh-mode
                smarty-mode
                clojure-mode
                lisp-mode
                textile-mode
                markdown-mode
                tuareg-mode))
  (add-to-list 'ac-modes mode))
