;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config/erlang-conf.el

(defvar erl-home "/usr/local/Cellar/erlang/R16B02")
(add-to-list 'load-path (concat erl-home "/lib/erlang/lib/tools-2.6.12/emacs/"))

(setq erlang-root-dir erl-home)
(add-to-list 'exec-path (concat erl-home "/bin"))
(setq erlang-man-root-dir (concat erl-home "/man"))

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

(require 'erlang-start)
