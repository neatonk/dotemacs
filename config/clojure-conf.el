;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/clojure-conf.el

;; Load and configure SLIME
(require 'slime)
(eval-after-load 'slime '(setq slime-protocol-version 'ignore))
(slime-setup '(slime-repl))

;; Load a major mode for editing Clojure code.
(require 'clojure-mode)
(require 'clojure-test-mode) ;; requires slime

;; Add paredit hook
(require 'paredit)
(add-hook 'clojure-mode-hook (lambda () (paredit-mode +1)))
