(add-hook 'cider-repl-mode-hook 'enable-paredit-mode)

(setq cider-repl-wrap-history t)
(setq cider-repl-history-file (user-root "cider-repl-history"))
