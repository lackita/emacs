(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(after-save-hook nil)
 '(auto-save-default nil)
 '(c-basic-offset 4)
 '(compilation-scroll-output t)
 '(enable-recursive-minibuffers t)
 '(eshell-modify-global-environment t)
 '(fill-column 80)
 '(icomplete-mode t)
 '(ido-max-directory-size 300000)
 '(indent-tabs-mode t)
 '(isearch-resume-in-command-history t)
 '(ispell-program-name "aspell" t)
 '(kill-whole-line t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(paren-mode (quote paren) nil (paren))
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(scroll-bar-mode nil)
 '(search/replace-region-as-default-flag t)
 '(shift-select-mode nil)
 '(show-paren-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-default default-buffer-file-coding-system 'utf-8-unix)

(put 'narrow-to-region 'disabled nil)

(ido-mode)

(global-set-key (kbd "C-x C-r") (lambda ()
								  (interactive)
								  (revert-buffer nil t)))

(mapcar (lambda (directory)
		  (let ((default-directory (concat "~/.emacs.d/" directory)))
			(normal-top-level-add-subdirs-to-load-path)
			(push default-directory load-path)))
		'("elisp" "elpa"))

(global-set-key [f5] (lambda () (require 'athena-customizations)))
(global-set-key [f6] 'recompile)

(global-hl-line-mode t)

(require 'org-customizations)
(require 'cperl-customizations)
(require 'windows-customizations)
(require 'experimental-customizations)
