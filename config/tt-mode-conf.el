;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/tt-mode-conf.el

(autoload 'tt-mode "tt-mode")
(add-to-list 'auto-mode-alist '("\\.tt\\'" . tt-mode))
(add-to-list 'auto-mode-alist '("\\.tt2\\'" . tt-mode))
