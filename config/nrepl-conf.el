;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/nrepl-mode-conf.el


(require 'nrepl)
(require 'ac-nrepl)
(require 'auto-complete)
(require 'paredit)

(setq nrepl-popup-stacktraces nil)
(setq nrepl-history-file (user-root "nrepl-history"))

(defun my-nrepl-mode-setup ()
  (require 'nrepl-ritz)
  (nrepl-turn-on-eldoc-mode)
  (enable-paredit-mode)
  (ac-nrepl-setup))

(add-hook 'nrepl-mode-hook 'my-nrepl-mode-setup)
(add-hook 'nrepl-interaction-mode-hook 'my-nrepl-mode-setup)
(add-hook 'nrepl-popup-buffer-mode-hook 'buffer-disable-undo)

(add-to-list 'same-window-buffer-names "*nrepl*")

(eval-after-load 'auto-complete
  '(add-to-list 'ac-modes 'nrepl-mode))
