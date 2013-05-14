;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/clojure-conf.el

(require 'ac-nrepl)
(require 'auto-complete)
(require 'clojure-mode)
(require 'nrepl)
(require 'paredit)
;;(require 'rainbow-delimiters)

(defun my-nrepl-mode-setup ()
  (require 'nrepl-ritz)
  (nrepl-turn-on-eldoc-mode)
  (enable-paredit-mode)
  (ac-nrepl-setup))

(add-hook 'nrepl-interaction-mode-hook 'my-nrepl-mode-setup)
(add-hook 'nrepl-mode-hook 'my-nrepl-mode-setup)
(add-hook 'nrepl-popup-buffer-mode-hook 'buffer-disable-undo)

(add-hook 'clojure-mode-hook 'enable-paredit-mode)
;;(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(setq nrepl-popup-stacktraces nil)

(add-to-list 'same-window-buffer-names "*nrepl*")

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (fn [] ...) -> (λ [] ...)
;; (eval-after-load 'clojure-mode
;;   '(font-lock-add-keywords
;;     'clojure-mode `(("(\\(fn\\)[\[[:space:]]"
;;                      (0 (progn (compose-region (match-beginning 1)
;;                                                (match-end 1) "λ")
;;                                nil))))))

;; ;; #(...) -> ƒ(...)
;; (eval-after-load 'clojure-mode
;;   '(font-lock-add-keywords
;;     'clojure-mode `(("\\(#\\)("
;;                      (0 (progn (compose-region (match-beginning 1)
;;                                                (match-end 1) "ƒ")
;;                                nil))))))

;; ;; #{...} -> ∈{...}
;; (eval-after-load 'clojure-mode
;;   '(font-lock-add-keywords
;;     'clojure-mode `(("\\(#\\){"
;;                      (0 (progn (compose-region (match-beginning 1)
;;                                                (match-end 1) "∈")
;;                                nil))))))
