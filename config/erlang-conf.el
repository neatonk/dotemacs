;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/erlang-conf.el

(require 'erlang-start)

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

(defvar erl-home "/usr/local/Cellar/erlang/R16B02")
(setq erlang-root-dir erl-home)
(add-to-list 'exec-path (concat erl-home "/bin"))
(setq erlang-man-root-dir (concat erl-home"/man"))
