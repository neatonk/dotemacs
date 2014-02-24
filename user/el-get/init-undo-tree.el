(require 'undo-tree)
(global-undo-tree-mode)

;;bindings
(define-key undo-tree-map (kbd "C-z")
  'undo-tree-undo)
(define-key undo-tree-map (kbd "C-S-z")
  'undo-tree-redo)
(define-key undo-tree-visualizer-map [return]
  'undo-tree-visualizer-quit)
