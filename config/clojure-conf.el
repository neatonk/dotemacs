;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/clojure-conf.el

;; Load and configure SLIME
(add-lib-path "slime")
(require 'slime)
(eval-after-load 'slime '(setq slime-protocol-version 'ignore))
(slime-setup '(slime-repl))

;; Load a major mode for editing Clojure code.
(add-lib-path "clojure-mode")
(require 'clojure-mode)
(require 'clojure-test-mode) ;; requires slime

;; Add paredit hook
(add-lib-path "paredit")
(require 'paredit)
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)
