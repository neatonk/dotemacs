(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-mode))
