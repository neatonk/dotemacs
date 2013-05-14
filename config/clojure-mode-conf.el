;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/clojure-mode-conf.el

(require 'clojure-mode)
(require 'paredit)

;;(require 'rainbow-delimiters)

(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojure-mode))

(add-hook 'clojure-mode-hook 'enable-paredit-mode)
;;(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

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
