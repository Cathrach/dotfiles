(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Cosmetics
(tool-bar-mode 0)
(tooltip-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0) ;; change to 1 if you can't find anything
(setq x-underline-at-descent-line t)
;; font selection (w32-select-font)
(set-face-attribute 'default nil  :font "DejaVu Sans Mono-12")
(setq doc-view-resolution 100)
;; theme
(load-theme 'moe-light t)

;; HI I HAVE SINGLE SPACE DELIMITED SENTENCES
(setq sentence-end-double-space nil)

;; backups
(setq backup-directory-alist `(("." . "~/.emacs.bak")))

;; Packages

;; Git
(use-package magit
  :config
  (global-set-key (kbd "C-c m") 'magit-status)
  )

;; Ivy and Swiper
(ivy-mode 1) ;; enable Ivy
(setq ivy-use-virtual-buffers t)
(setq enable-virtual-minibuffers t)
;; Counsel and Swiper serach functions
(global-set-key (kbd "C-c f r") #'counsel-recentf)
(global-set-key (kbd "C-c C-s") #'swiper)
;; replace some default functions with Counsel versions
(global-set-key (kbd "M-x") #'counsel-M-x)
(global-set-key (kbd "C-x C-f") #'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; AUCTeX
(require `tex-site)
(require `tex-style)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
;; Math mode
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(with-eval-after-load "tex"
  (add-to-list 'TeX-view-program-selection '(output-pdf "Okular"))
  )
(with-eval-after-load "preview"
  (add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzcd}" t)
  (add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t)
  )
(with-eval-after-load "latex" 
  (TeX-add-style-hook
   "latex"
   (lambda ()
     (LaTeX-add-environments
      '("Theorem" "name" "reference")
      '("Corollary" "name" "reference")
      '("Definition" "name" "reference")
      '("Lemma" "name" "reference")
      '("Example" "name" "reference")
      '("Proposition" "name" "reference")
      '("Claim" "name" "reference")
      '("Note" "name" "reference")
      '("Remark" "name" "reference")
      )
     )
   )
  )

;; Olivetti
(setq olivetti-body-width 120)
(add-hook 'text-mode-hook 'olivetti-mode) ;; enable olivetti for text-related modes, eg org-mode

;; Autocomplete

;; Org and Org-roam
(setq org-startup-numerated t)
(setq org-enforce-todo-checkbox-dependencies t)
(setq org-enforce-todo-dependencies t)
(add-to-list 'exec-path "~/bin/sqlite-tools")
(setq org-directory "D:/org-roam")
(setq org-greek-directory "D:/org-roam/greek")
(with-eval-after-load 'org
  (add-to-list 'org-modules 'org-habit t)
  (add-to-list 'org-modules 'org-drill t))

;; org tags
(setq org-tag-alist '(("today" . ?n) ("important" . ?i)
		      (:startgroup . nil)
		      ("fewdays" . ?d) ("oneweek" . ?w) ("longterm" . ?m)
		      (:endgroup . nil)
		      (:startgroup . nil)
		      ("latin125" . ?l) ("math231br" . ?a) ("cs175" . ?c) ("greek2" . ?g) ("thesis" . ?t) ("math132" . ?h)
		      (:endgroup . nil)
		      ("gradschool" . ?f) ("personal" . ?p) ("shopping" . ?s)
		      ))
(setq org-tag-faces '(("today" . (:background "yellow" :foreground "black" :weight bold))
		      ("important" . (:background "red" :weight bold :underline t :foreground "white"))
		      ("fewdays" . (:background "deep pink" :foreground "blanched almond")) ("oneweek" . (:background "magenta" :foreground "blanched almond")) ("longterm" . (:background "dark orchid" :foreground "blanched almond"))
		      ("latin125" . (:background "orange")) ("math231br" . (:background "sky blue")) ("cs175" . (:background "turquoise"))
		      ("greek2" . (:background "chocolate" :foreground "blanched almond")) ("thesis" . (:background "aquamarine")) ("math132" . (:background "indian red"))
		      ("gradschool" . (:background "moccasin"))
		      ("personal" . (:background "sienna" :foreground "blanched almond")) ("shopping" . (:backrgound "tan2"))
		      ))
(setq org-todo-keywords '((sequence "TODO(t)" "SCHEDULED(s)" "IN PROGRESS(i)" "|" "DONE(d)" "POSTPONED(p)" "CANCELLED(c)")))
(setq org-todo-keyword-faces
      '(("TODO" . (:background "salmon" :weight bold))
	("SCHEDULED" . (:foreground "blue" :weight bold))
	("IN PROGRESS" . (:foreground "dark green" :weight bold))
	("DONE" . (:background "green"))
	("POSTPONED" . (:background "brown"))
	("CANCELLED" . (:backrgound "gray"))
	))

(setq org-agenda-todo-list-sublevels nil)
;; deft with org-roam
(require 'deft)
(global-set-key (kbd "C-c n d") 'deft)
(with-eval-after-load 'org
  (setq deft-recursive t)
  (setq deft-use-filter-string-for-filename t)
  (setq deft-default-extension "org")
  (setq deft-directory org-directory))

;; pomodoro
(setq org-pomodoro-length 15)

;; org appearance
(setq org-hide-emphasis-markers t)
(custom-theme-set-faces
 'user
 '(variable-pitch ((t (:family "DejaVu Sans" :height 130))))
 '(fixed-pitch ((t (:family "DejaVu Sans Mono" :height 110))))
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit fixed-pitch))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-table ((t (:inherit fixed-pitch))))
 '(org-verbatim ((t (:inherit (shadow fixed pitch)))))
 '(org-latex-and-related ((t (:inherit fixed-pitch :foreground "SaddleBrown"))))
)
(add-hook 'org-mode-hook 'variable-pitch-mode)

;; org latex
(setq org-preview-latex-default-process 'dvipng)

;; org-roam directory
(setq org-roam-directory "D:/org-roam")
(setq org-roam-capture-templates
      '(("d" "default" plain (function org-roam--capture-get-point)
     "%?"
     :file-name "%<%Y%m%d%H%M%S>-${slug}"
     :head "#+title: ${title}\n"
     :unnarrowed t)
	("g" "greek" plain (function org-roam-capture--get-point)
	      "%?"
	      :file-name "greek/${slug}"
	      :head "#+title: Greek ${title}\n#+roam_tags: Greek "
	      :unnarrowed t)
	))
	
(setq org-roam-dailies-directory "daily/")
(setq org-roam-dailies-capture-templates
      '(("d" "daily" entry
         #'org-roam-capture--get-point
         "* %?"
         :file-name "daily/%<%Y-%m-%d>"
         :head "#+title: %<%Y-%m-%d>\n\n* Tasks\n\n* Notes\n\n* Tomorrow")))

;; start org-roam-mode when Emacs starts
(add-hook 'after-init-hook 'org-roam-mode)
(setq initial-major-mode 'org-mode)

;; org keybindings
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; org-agenda settings
(setq org-agenda-show-inherited-tags nil)

;; org capture
(setq org-inbox (concat org-directory "/inbox.org"))
(setq org-capture-templates
      '(("t" "TODO" entry (file+headline org-inbox "Todos")
	 "* TODO %?")
	("e" "email" entry (file+headline org-inbox "Emails")
	 "* TODO email %?")
	("i" "idea" entry (file+headline org-inbox "Thoughts")
	 "* TODO %?")
	("a" "appointment" entry (file+headline org-inbox "Appointments")
	 "* TODO %?")
	("v" "vocab" entry (file+headline "D:/org-roam/greek/master.org" "Cards")
	 "* Vocab :drill:\n:PROPERTIES:\n:DRILL_CARD_TYPE: twosided\n:END:\n\n** Greek\n%?\n** English")
	)) ;; YES I KNOW THE FIRST AND LAST ARE THE SAME SHUT UP

;; org refiling
(setq org-refile-targets
      `((org-agenda-files :maxlevel . 1)
	(,(concat org-greek-directory "/master.org") :regexp . "Todos")
	(,(concat org-greek-directory "/first_declension_nouns.org") :regexp . "Cards")
	(,(concat org-greek-directory "/second_declension_nouns.org") :regexp . "Cards")
	(,(concat org-greek-directory "/third_declension_nouns.org") :regexp . "Cards")
	(,(concat org-greek-directory "/adjectives.org") :regexp . "Cards")
	(,(concat org-greek-directory "/212_adjectives.org") :regexp . "Cards")
	(,(concat org-greek-directory "/333_adjectives.org") :regexp . "Cards")
	(,(concat org-greek-directory "/313_adjectives.org") :regexp . "Cards")	
	(,(concat org-greek-directory "/prepositions.org") :regexp . "Cards")
	(,(concat org-greek-directory "/verbs.org") :regexp . "Cards")
	(,(concat org-greek-directory "/pronouns.org") :regexp . "Cards")
	(,(concat org-greek-directory "/interrogatives.org") :regexp . "Cards")
	(,(concat org-greek-directory "/comparatives_and_superlatives.org") :regexp . "Cards")
	(,(concat org-greek-directory "/adverbs.org") :regexp . "Cards")
	(,(concat org-greek-directory "/particles.org") :regexp . "Cards")
	)) ;; for now, might want to set specific files later.
(setq org-refile-use-outline-path 'file
      org-outline-path-complete-in-steps nil)
;; org-roam keybindings
(global-set-key (kbd "C-c n r") #'org-roam-buffer-toggle-display)
(global-set-key (kbd "C-c n i") #'org-roam-insert)
(global-set-key (kbd "C-c n /") #'org-roam-find-file)
(global-set-key (kbd "C-c n b") #'org-roam-switch-to-buffer)
(global-set-key (kbd "C-c n d") #'org-roam-find-directory)
(global-set-key (kbd "C-c n t") #'org-roam-dailies-find-today)

;; org-ref
;; default bibliography (uncomment when I actually have one)
(setq org-ref-default-bibliography '("D:/org-roam/references.bib"))
(setq org-ref-pdf-directory "D:/org-roam/bibtex_pdfs/")
(setq bibtex-completion-bibliography '("D:/org-roam/references.bib"))
(global-set-key (kbd "<f6>") #'org-ref-ivy-cite-completion)


;; org-roam-bibtex
(require 'org-roam-bibtex)
(add-hook 'after-init-hook #'org-roam-bibtex-mode)
(define-key org-roam-bibtex-mode-map (kbd "C-c n a") #'orb-note-actions)

;; Go
(add-to-list 'exec-path "D:/go/bin")
(setenv "GOPATH" "D:/go")
(add-to-list 'exec-path "C:/go/bin")
(defun custom-go-mode-hook ()
  ;; use goimports
  (setq gofmt-command "goimports")
  ;; gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ;; godef bindings
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  ;; autocomplete
  (auto-complete-mode 1)
  ;; compile should run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
	   "go build -v && go test -v && go vet"
	   )
    )
  ;; tab width
  (setq tab-width 4)
  )
(add-hook 'go-mode-hook 'custom-go-mode-hook)
(with-eval-after-load 'go-mode
  (require 'go-autocomplete)
  (require 'go-guru))


;; Hunspell
(add-to-list 'exec-path "~/bin/hunspell")
(setq ispell-program-name "hunspell")
(setq ispell-hunspell-dict-paths-alist
      '(("en_US" "~/bin/hunspell_dicts/en_US.aff")
      ("classical_la" "~/bin/hunspell_dicts/classical_la.aff")
      ("grc_GR" "~/bin/hunspell_dicts/grc_GR.aff")
      ))
(setq ispell-local-dictionary "en_US")
(setq ispell-local-dictionary-alist
      '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)
	("classical_la" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "classical_la") nil utf-8)
	("grc_GR" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "grc_GR") nil utf-8)
	))
				      

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("d:/org-roam/spring_2021_meetings.org" "d:/org-roam/spring_2021_classes.org" "d:/org-roam/20210223102750-quantum_groups_seminar.org" "d:/org-roam/20210222181730-grad_school_visits.org" "d:/org-roam/20210101141707-longest_a_tails_varepsilon_a_m.org" "D:/org-roam/20201224153158-formal_characters_of_representations_of_hecke_algebras.org" "D:/org-roam/greek/master.org" "D:/org-roam/inbox.org" "D:/org-roam/20201221201450-personal.org" "D:/org-roam/20201221192840-piano.org" "D:/org-roam/20201221195658-exercise.org" "D:/org-roam/daily/2020-12-20.org" "D:/org-roam/daily/2020-12-19.org"))
 '(package-selected-packages
   '(org-gcal moe-theme org-pomodoro go-guru auctex magit git go-autocomplete auto-complete exec-path-from-shell go-mode org pkg-info org-pdftools rust-mode deft org-drill ivy-bibtex org-ref org-roam-bibtex olivetti swiper-helm counsel ivy org-roam)))
