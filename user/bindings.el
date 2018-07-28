;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/user/bindings.el

;; put cutsom keybindings here.

;; don't background emacs!
(define-key global-map (kbd "C-z") nil)

;; Undo
(define-key global-map (kbd "C-z") 'undo)

;; text scale
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
