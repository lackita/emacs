(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(after-save-hook nil)
 '(appt-message-warning-time 0)
 '(auto-save-default nil)
 '(c-basic-offset 4)
 '(compilation-scroll-output t)
 '(compile-command "verify_code ")
 '(cperl-brace-imaginary-offset 0)
 '(cperl-close-paren-offset -4)
 '(cperl-continued-brace-offset 0)
 '(cperl-continued-statement-offset 0)
 '(cperl-fix-hanging-brace-when-indent t)
 '(cperl-indent-comment-at-column-0 t)
 '(cperl-indent-level 4)
 '(cperl-indent-parens-as-block t)
 '(cperl-indent-region-fix-constructs 1)
 '(cperl-indent-subs-specially nil)
 '(cperl-indent-wrt-brace t)
 '(cperl-label-offset 0)
 '(cperl-lineup-step nil)
 '(cperl-merge-trailing-else nil)
 '(cperl-use-syntax-table-text-property t)
 '(cperl-use-syntax-table-text-property-for-tags t)
 '(dml-master-root-instance "ATEST1")
 '(enable-recursive-minibuffers t)
 '(eshell-modify-global-environment t)
 '(exec-path (quote ("/usr/lib/lightdm/lightdm" "/usr/local/sbin" "/usr/local/bin" "/usr/sbin" "/usr/bin" "/sbin" "/bin" "/usr/games" "/usr/lib/emacs/23.3/i686-linux-gnu")))
 '(filesets-data (quote (("refresh" (:files "/plink:dev202.athenahealth.com:/home/cwilliams/archive/p4/prod/perllib/Athena/DevRefresh/Stackgroup.pm")) ("hermes" (:files "/plink:dev202.athenahealth.com:/home/cwilliams/archive/p4/intranet/scripts/qa/regression/hermes.pl" "/plink:dev202.athenahealth.com:/home/cwilliams/archive/p4/intranet/hermes/" "/plink:dev202.athenahealth.com:/home/cwilliams/archive/p4/intranet/perllib/Athena/Hermes/")) ("diffrules" (:files "/plink:dev202.athenahealth.com:archive/p4/prod/scripts/qa/diffrules/")) ("emacs" (:files "/home/cwilliams/.emacs")))))
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
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96)))
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(tramp-remote-path (quote (tramp-default-remote-path "/bin" "/usr/bin" "/usr/sbin" "/usr/local/bin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/home/cwilliams/archive/p4/techops/coredev/bin" "/home/cwilliams/archive/perl")))
 '(user-mail-address "cwilliams@athenahealth.com")
 '(vc-git-program "C:\\RailsInstaller\\Git\\bin\\git.exe"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(defalias 'perl-mode 'cperl-mode)
(push '("\\.diffrule\\'" . cperl-mode) auto-mode-alist)
(push '("\\.esp\\'" . cperl-mode) auto-mode-alist)

(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-default default-buffer-file-coding-system 'utf-8-unix)

(defun load-dev ()
  (interactive)
  (let* ((dev (concat "dev202"))
	 (p4-home (concat "/plink:" dev ":~/archive/p4/"))
	 (path (concat p4-home "techops/coredev/emacs/")))
	(load-library (concat path "dml"))
    (load-file (concat path "vc-p4.el"))
	(load-file (concat path "skeletons.el"))
    (load-file (concat path "athena.el"))))
    ;(visit-tags-table (concat p4-home "intranet/perllib/Athena/tags"))))
(put 'narrow-to-region 'disabled nil)

(defun athena-compile-current-buffer ()
  (interactive)
  (let ((file-name (if (tramp-tramp-file-p (buffer-file-name))
					   (tramp-file-name-localname (tramp-dissect-file-name (buffer-file-name)))
					 (buffer-file-name))))
	(if (string-match "\\(perllib/Athena\\|htdocs\\|hermes\\|scripts\\)/\\(.*\\)\\.\\(esp\\|pm\\|pl\\)$" file-name)
		(compile (concat "verify_code --strict " file-name
						 " && utest " (mapconcat 'identity
												 (split-string (match-string 2 file-name)
															   "/") "::") )))))

(ido-mode)

(require 'filesets)
(global-set-key (kbd "C-x C-S-f") 'filesets-open)
(global-set-key (kbd "C-x C-S-s") (lambda ()
									  (interactive)
									  (filesets-add-buffer)
									  (filesets-save-config)))
(global-set-key (kbd "C-x C-r") (lambda ()
								  (interactive)
								  (revert-buffer nil t)))


(let ((default-directory "~/.emacs.d/elisp/"))
  (normal-top-level-add-subdirs-to-load-path))
(push "~/.emacs.d/elisp/" load-path)
(let ((default-directory "~/.emacs.d/elpa/"))
  (normal-top-level-add-subdirs-to-load-path))
(push "~/.emacs.d/elpa/" load-path)

(global-set-key [f5] 'load-dev)
(global-set-key [f6] 'recompile)

(eval-after-load "replace" '(progn (require 'replace+)))

(require 'multiple-cursors)
(global-set-key (kbd "C-<return>") (lambda ()
									 (interactive)
									 (push-mark isearch-other-end nil t)
									 (mc/mark-all-like-this)))

(require 'ace-jump-mode)
(define-key global-map (kbd "C-;") 'ace-jump-mode)

(fset 'block-comment
   [?\C-s ?# ?# ?# ?\C-a ?\C-k ?\C-  ?\C-s ?d ?e ?s ?c ?\C-a ?\C-n ?\C-w ?\C-s ?# ?# ?# ?\C-a ?\C-k ?\C-x ?\C-x ?\M-% ?\C-i ?\C-m ?  ?\C-m ?!])

;; (defadvice cperl-make-indent (after sql-select-indent)
;;   "insert `cperl-indent-level' spaces if the previous line is SQL::Select->new("
;;   (if (string-match "SQL::Select->new(" (buffer-substring-no-properties (line-beginning-position 0) (line-end-position 0)))
;; 	  (indent-to 

(require 'yasnippet)
(yas-global-mode t)

(require 'undo-tree)
(global-undo-tree-mode)

(global-hl-line-mode t)

;; (require 'editortools)
(require 'org-customizations)
