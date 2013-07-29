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
 '(org-agenda-files (quote ("c:/Users/cwilliams/Dropbox/org/work/teaching.org" "c:/Users/cwilliams/Dropbox/org/work/teaching (Jayne's conflicted copy 2013-07-29).org" "c:/Users/cwilliams/Dropbox/org/work/side_projects.org" "c:/Users/cwilliams/Dropbox/org/work/scrum.org" "c:/Users/cwilliams/Dropbox/org/work/regressions.org" "c:/Users/cwilliams/Dropbox/org/work/regressions (Jayne's conflicted copy 2013-07-29).org" "c:/Users/cwilliams/Dropbox/org/work/qa_queue.org" "c:/Users/cwilliams/Dropbox/org/work/qa_queue (Jayne's conflicted copy 2013-07-29).org" "c:/Users/cwilliams/Dropbox/org/work/build.org" "c:/Users/cwilliams/Dropbox/org/work/administrative.org" "c:/Users/cwilliams/Dropbox/org/stuff.org" "c:/Users/cwilliams/Dropbox/org/social/vacation.org" "c:/Users/cwilliams/Dropbox/org/social/trek.org" "c:/Users/cwilliams/Dropbox/org/social/sara.org" "c:/Users/cwilliams/Dropbox/org/social/possible_groups.org" "c:/Users/cwilliams/Dropbox/org/social/outings.org" "c:/Users/cwilliams/Dropbox/org/social/mom.org" "c:/Users/cwilliams/Dropbox/org/social/miscellaneous.org" "c:/Users/cwilliams/Dropbox/org/social/grandma.org" "c:/Users/cwilliams/Dropbox/org/social/dad.org" "c:/Users/cwilliams/Dropbox/org/social/adrianna.org" "c:/Users/cwilliams/Dropbox/org/sites.org" "c:/Users/cwilliams/Dropbox/org/shipping.org" "c:/Users/cwilliams/Dropbox/org/routine.org" "c:/Users/cwilliams/Dropbox/org/routine (Jayne's conflicted copy 2013-07-29).org" "c:/Users/cwilliams/Dropbox/org/reading.org" "c:/Users/cwilliams/Dropbox/org/programming.org" "c:/Users/cwilliams/Dropbox/org/politics.org" "c:/Users/cwilliams/Dropbox/org/pet.org" "c:/Users/cwilliams/Dropbox/org/organization.org" "c:/Users/cwilliams/Dropbox/org/organization (Jayne's conflicted copy 2013-07-29).org" "c:/Users/cwilliams/Dropbox/org/miscellaneous.org" "c:/Users/cwilliams/Dropbox/org/meals.org" "c:/Users/cwilliams/Dropbox/org/meals (Jayne's conflicted copy 2013-07-29).org" "c:/Users/cwilliams/Dropbox/org/loaned_books.org" "c:/Users/cwilliams/Dropbox/org/home/outside.org" "c:/Users/cwilliams/Dropbox/org/home/membership.org" "c:/Users/cwilliams/Dropbox/org/home/inside.org" "c:/Users/cwilliams/Dropbox/org/home/inside (Jayne's conflicted copy 2013-07-29).org" "c:/Users/cwilliams/Dropbox/org/home/donald.org" "c:/Users/cwilliams/Dropbox/org/home/car.org" "c:/Users/cwilliams/Dropbox/org/health/triglycerides.org" "c:/Users/cwilliams/Dropbox/org/health/meditation.org" "c:/Users/cwilliams/Dropbox/org/health/ideas.org" "c:/Users/cwilliams/Dropbox/org/health/hygiene.org" "c:/Users/cwilliams/Dropbox/org/health/hygiene (Jayne's conflicted copy 2013-07-29).org" "c:/Users/cwilliams/Dropbox/org/health/fitness.org" "c:/Users/cwilliams/Dropbox/org/health/doctor.org" "c:/Users/cwilliams/Dropbox/org/health/adrianna.org" "c:/Users/cwilliams/Dropbox/org/gifts/me.org" "c:/Users/cwilliams/Dropbox/org/gifts/general.org" "c:/Users/cwilliams/Dropbox/org/gifts/christian.org" "c:/Users/cwilliams/Dropbox/org/gifts/adrianna.org" "c:/Users/cwilliams/Dropbox/org/games/lost_interest.org" "c:/Users/cwilliams/Dropbox/org/games/dungeon_overlord.org" "c:/Users/cwilliams/Dropbox/org/games/dungeon_overlord (Jayne's conflicted copy 2013-07-29).org" "c:/Users/cwilliams/Dropbox/org/games/cooperative.org" "c:/Users/cwilliams/Dropbox/org/from-mobile.org" "c:/Users/cwilliams/Dropbox/org/friends.org" "c:/Users/cwilliams/Dropbox/org/finances/taxes.org" "c:/Users/cwilliams/Dropbox/org/finances/stock.org" "c:/Users/cwilliams/Dropbox/org/finances/reimbursements.org" "c:/Users/cwilliams/Dropbox/org/finances/phone.org" "c:/Users/cwilliams/Dropbox/org/finances/loans.org" "c:/Users/cwilliams/Dropbox/org/finances/credit_cards.org" "c:/Users/cwilliams/Dropbox/org/finances/credit.org" "c:/Users/cwilliams/Dropbox/org/finances/budget.org" "c:/Users/cwilliams/Dropbox/org/finances/banks.org" "c:/Users/cwilliams/Dropbox/org/errands.org" "c:/Users/cwilliams/Dropbox/org/entertainment.org" "c:/Users/cwilliams/Dropbox/org/education.org" "c:/Users/cwilliams/Dropbox/org/education (Jayne's conflicted copy 2013-07-29).org" "c:/Users/cwilliams/Dropbox/org/devices.org" "c:/Users/cwilliams/Dropbox/org/checklists/travel.org" "c:/Users/cwilliams/Dropbox/org/career/phd.org" "c:/Users/cwilliams/Dropbox/org/career/open_source.org" "c:/Users/cwilliams/Dropbox/org/career/new_job.org" "c:/Users/cwilliams/Dropbox/org/career/blog.org" "c:/Users/cwilliams/Dropbox/org/career/advisory_board.org")))
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

(global-set-key [f5] (lambda () (interactive) (require 'athena-customizations)))
(global-set-key [f6] 'recompile)

(global-hl-line-mode t)

(require 'org-customizations)
(require 'cperl-customizations)
(if (eq system-type 'windows-nt)
	(require 'windows-customizations))
(require 'experimental-customizations)
