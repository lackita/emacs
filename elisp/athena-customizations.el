(setq dml-master-root-instance "ATEST1"
    tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96)
    user-mail-address "cwilliams@athenahealth.com")

(push '("\\.diffrule\\'" . cperl-mode) auto-mode-alist)
(push '("\\.esp\\'" . cperl-mode) auto-mode-alist)

;; (defadvice cperl-make-indent (after sql-select-indent)
;;   "insert `cperl-indent-level' spaces if the previous line is SQL::Select->new("
;;   (if (string-match "SQL::Select->new(" (buffer-substring-no-properties (line-beginning-position 0) line-end-position 0)))
;;     (indent-to 

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

(let* ((dev (concat "dev202"))
     (p4-home (concat "/plink:" dev ":~/archive/p4/"))
     (path (concat p4-home "techops/coredev/emacs/")))
  (load-library (concat path "dml"))
  (load-file (concat path "vc-p4.el"))
  (load-file (concat path "skeletons.el"))
  (load-file (concat path "athena.el")))
;(visit-tags-table (concat p4-home "intranet/perllib/Athena/tags"))))

(provide 'athena-customizations)
