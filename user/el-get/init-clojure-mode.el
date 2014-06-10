(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojure-mode))
(add-hook 'clojure-mode-hook 'enable-paredit-mode)

;;(define-clojure-indent (this-as 1))

;;(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

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
