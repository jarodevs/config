(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e27c9668d7eddf75373fa6b07475ae2d6892185f07ebed037eedf783318761d7"
     "c171012778b7cf795ac215b91e1ecab8e3946738d03095397a790ed41e0a3386"
     "21055a064d6d673f666baaed35a69519841134829982cbbb76960575f43424db"
     "15604b083d03519b0c2ed7b32da6d7b2dc2f6630bef62608def60cdcf9216184"
     default))
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(impatient-mode simple-httpd ace-window dashboard page-break-lines
		    page-break-line spacious-padding golden-ratio
		    solaire-mode modus-themes org-agenda drag-stuff
		    org-wild-notifier terminal-notifier
		    gruber-darker-theme flycheck-rust rustic
		    autothemer orderless cape corfu lsp-ui lsp-mode
		    multi-vterm vterm ayu-theme doom-themes
		    cyberpunk-theme eterm-256color forge yasnippet
		    terraform-mode hcl-mode flycheck neotree
		    emacs-neotree org-mode ivy-prescient
		    exec-path-from-shell evil-magit magit
		    counsel-projectile projectile general
		    all-the-icons helpful ivy-rich counsel swiper ivy
		    which-key doom-modeline evil))
 '(safe-local-variable-values '((lsp-eslint-options "--config" "./functions/.eslintrc")))
 '(warning-suppress-log-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t :background "#000000")))
 '(header-line ((t :box (:line-width 4 :color "#1e1e1e" :style nil))))
 '(header-line-highlight ((t :box (:color "#ffffff"))))
 '(keycast-key ((t)))
 '(line-number ((t :background "#000000")))
 '(mode-line ((t :background "#000000" :overline "#f0f0f0" :box (:line-width 6 :color "#000000" :style nil))))
 '(mode-line-active ((t :background "#000000" :overline "#f0f0f0" :box (:line-width 6 :color "#000000" :style nil))))
 '(mode-line-highlight ((t :box (:color "#ffffff"))))
 '(mode-line-inactive ((t :background "#000000" :overline "#646464" :box (:line-width 6 :color "#000000" :style nil))))
 '(tab-bar-tab ((t :box (:line-width 4 :color "#000000" :style nil))))
 '(tab-bar-tab-inactive ((t :box (:line-width 4 :color "#545454" :style nil))))
 '(window-divider ((t :background "#000000" :foreground "#000000")))
 '(window-divider-first-pixel ((t :background "#000000" :foreground "#000000")))
 '(window-divider-last-pixel ((t :background "#000000" :foreground "#000000"))))

(setq package-enable-at-startup nil)

  (defvar bootstrap-version)
  (let ((bootstrap-file
	 (expand-file-name
	  "straight/repos/straight.el/bootstrap.el"
	  (or (bound-and-true-p straight-base-dir)
	      user-emacs-directory)))
	(bootstrap-version 7))
    (unless (file-exists-p bootstrap-file)
      (with-current-buffer
	  (url-retrieve-synchronously
	   "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
	   'silent 'inhibit-cookies)
	(goto-char (point-max))
	(eval-print-last-sexp)))
    (load bootstrap-file nil 'nomessage))
  (straight-use-package 'use-package)
  (setq straight-use-package-by-default t)

(use-package org
  :straight t
  :ensure t)

(org-babel-load-file "~/.config/emacs/config.org")
