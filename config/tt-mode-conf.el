;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/tt-mode-conf.el

(autoload 'tt-mode "tt-mode")
(setq auto-mode-alist (append '(("\\.tt$" . tt-mode))  auto-mode-alist))
