(setq cperl-brace-imaginary-offset 0
	  cperl-close-paren-offset -4
	  cperl-continued-brace-offset 0
	  cperl-continued-statement-offset 0
	  cperl-fix-hanging-brace-when-indent t
	  cperl-indent-comment-at-column-0 t
	  cperl-indent-level 4
	  cperl-indent-parens-as-block t
	  cperl-indent-region-fix-constructs 1
	  cperl-indent-subs-specially nil
	  cperl-indent-wrt-brace t
	  cperl-label-offset 0
	  cperl-lineup-step nil
	  cperl-merge-trailing-else nil
	  cperl-use-syntax-table-text-property t
	  cperl-use-syntax-table-text-property-for-tags t)

(defalias 'perl-mode 'cperl-mode)

(provide 'cperl-customizations)
