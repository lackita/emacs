(require 'org)
(require 'find-lisp)

(setq org-agenda-custom-commands '(("n" "Agenda and all TODO's" ((agenda "") (alltodo)))
								   ("w" "Work" tags "+work-waiting-maybe-SCHEDULED>\"<now>\"/TODO")
								   ("h" "Home" tags "-waiting-maybe-work-SCHEDULED>\"<now>\"/TODO")
								   ("c" "Couch" tags "+internet-adrianna-desktop-waiting-maybe-work-SCHEDULED>\"<now>\"/TODO"))
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
