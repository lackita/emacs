(require 'org)
(require 'find-lisp)

(defun calendar-command (key description search)
  `(,key ,description ((agenda "" ((org-agenda-ndays 1)
								   (org-agenda-tag-filter-preset '(,search))
								   (org-agenda-entry-types '(:timestamp :sexp :deadline)))))))
(defun tags-command (key description search)
  (list key description 'tags (concat search "-waiting-maybe-SCHEDULED>\"<now>\"/TODO")))
(setq org-agenda-custom-commands `(,(calendar-command "w" "Work Calendar" "+work")
								   ,(tags-command "W" "Work Tasks" "+work")
								   ,(calendar-command "h" "Home Calendar" "-work")
								   ,(tags-command "H" "Home Tasks" "-work-internet-errands-outside-netbook")
								   ,(tags-command "O" "Outdoor Tasks" "outside")
								   ,(tags-command "i" "Internet Tasks" "+internet-adrianna-work")
								   ("n" "Netbook" tags "netbook"))
	  org-agenda-include-diary t
	  org-agenda-ndays 1
	  org-agenda-skip-deadline-prewarning-if-scheduled t
	  org-agenda-skip-scheduled-if-done t
	  org-agenda-window-setup (quote current-window)
	  org-archive-location "~/Dropbox/org/archive/%s_archive::"
	  org-deadline-warning-days 4
	  org-directory "~/Dropbox/org"
	  org-file-apps '((auto-mode . emacs)
					  ("\\.mm\\'" . default)
					  ("\\.x?html?\\'" . default)
					  ("\\.pdf\\'" . default)
					  ("\\.ppt\\'" . default))
	  org-habit-show-habits-only-for-today nil
	  org-link-abbrev-alist '(("hydra" . "https://intranet.athenahealth.com/hydra/taskview.esp?ID=")
							  ("wiki" . "https://intranet.athenahealth.com/wiki/node.esp?ID=")
							  ("hermes" . "https://intranet.athenahealth.com/hermes/queue/view.esp?JOBID="))
	  org-log-done 'time
	  org-log-into-drawer t
	  org-mobile-inbox-for-pull "~/Dropbox/org/from-mobile.org"
	  org-modules '(org-bbdb org-bibtex org-docview org-gnus org-info org-jsinfo
					org-habit org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m
					org-checklist org-learn org-registry org2rem)
	  org-scheduled-past-days 1
	  appt-message-warning-time 0
	  org-agenda-files (find-lisp-find-files "~/Dropbox/org" "\.org$")
	  org-mobile-directory "~/Dropbox/MobileOrg")

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
;(org-agenda-to-appt)

(provide 'org-customizations)
