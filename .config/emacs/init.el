(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("21055a064d6d673f666baaed35a69519841134829982cbbb76960575f43424db" "15604b083d03519b0c2ed7b32da6d7b2dc2f6630bef62608def60cdcf9216184" default))
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(ace-window dashboard page-break-lines page-break-line spacious-padding golden-ratio solaire-mode modus-themes org-agenda drag-stuff org-wild-notifier terminal-notifier gruber-darker-theme flycheck-rust rustic autothemer orderless cape corfu lsp-ui lsp-mode multi-vterm vterm ayu-theme doom-themes cyberpunk-theme eterm-256color forge yasnippet terraform-mode hcl-mode flycheck neotree emacs-neotree org-mode ivy-prescient exec-path-from-shell evil-magit magit counsel-projectile projectile general all-the-icons helpful ivy-rich counsel swiper ivy which-key doom-modeline evil))
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

(package-initialize)
(org-babel-load-file "~/.config/emacs/config.org")
