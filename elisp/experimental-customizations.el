(require 'multiple-cursors)
(global-set-key (kbd "C-<return>") (lambda ()
									 (interactive)
									 (push-mark isearch-other-end nil t)
									 (mc/mark-all-like-this)))

(require 'ace-jump-mode)
(define-key global-map (kbd "C-;") 'ace-jump-char-mode)

(fset 'block-comment
   [?\C-s ?# ?# ?# ?\C-a ?\C-k ?\C-  ?\C-s ?d ?e ?s ?c ?\C-a ?\C-n ?\C-w ?\C-s ?# ?# ?# ?\C-a ?\C-k ?\C-x ?\C-x ?\M-% ?\C-i ?\C-m ?  ?\C-m ?!])

(eval-after-load "replace" '(progn (require 'replace+)))

(require 'yasnippet)
(yas-global-mode t)

(require 'undo-tree)
(global-undo-tree-mode)

(require 'editortools)

(provide 'experimental-customizations)
