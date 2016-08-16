(autoload 'web-mode "web-mode.el" t)

(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))

(add-hook 'web-mode-hook 'flyspell-mode)
