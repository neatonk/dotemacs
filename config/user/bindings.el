;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/user/bindings.el

;; put cutsom keybindings here.

;; don't background emacs!
(define-key global-map (kbd "C-z") nil)

;; text scale
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; clojure mode
(define-key clojure-mode-map (kbd "C-x j") 'nrepl-jack-in)
