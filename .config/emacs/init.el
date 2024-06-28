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

;; Configuration
(setq straight-use-package-by-default t
      auth-sources '("~/.authinfo.gpg")
      display-line-numbers-type 'relative
      mac-option-modifier 'meta                
      lexical-binding t
      auth-sources '("~/.authinfo.gpg")
      dired-dwim-target t
      display-time-format "%H:%M"
)

(setq-default indent-tabs-mode nil)

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  :config
  (setq evil-want-minibuffer t
        evil-search-module 'evil-search
        evil-undo-system 'undo-redo)
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package helpful
  :commands (helpful-callable helpful-variable helpful-command helpful-key)
  :bind
  ([remap describe-command] . helpful-command)
  ([remap describe-key] . helpful-key))

(use-package org
  :hook
    (org-mode . org-indent-mode)
  :config
    (setq org-agenda-files '("~/Documents/org/")
          org-ellipsis " ▾"
          org-log-done 'time)
    (evil-set-initial-state 'org-agenda-mode 'normal))

(use-package vterm
  :init
  (defun vterm-process-query-on-exit ()
    (let ((proc (get-buffer-process (current-buffer))))
      (when proc
        (set-process-query-on-exit-flag proc nil))))
  :hook
    (vterm-mode . vterm-process-query-on-exit)
  :ensure t)

(use-package multi-vterm)

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))


(use-package magit
  :commands (magit-status magit-get-current-branch)
  :config
    (setq display-line-numbers-type 'visual)
    (global-display-line-numbers-mode t)
    (setq magit-section-disable-line-numbers nil)
    (setq magit-process-finish-apply-ansi-colors t)
    (setq magit-show-long-lines-warning nil)
    (evil-define-key 'normal magit-section-mode-map (kbd "1") nil)
    (evil-define-key 'normal magit-section-mode-map (kbd "2") nil)
    (evil-define-key 'normal magit-section-mode-map (kbd "3") nil)
    (evil-define-key 'normal magit-section-mode-map (kbd "4") nil))

(use-package git-link)

(use-package forge
  :after magit
  :config
  (setq forge-add-default-bindings nil))

(use-package perspective
  :straight t
  :bind
  ("C-x M-n" . 'persp-next)
  ("C-x M-p" . 'persp-prev)
  ("C-x M-s" . 'persp-state-save)
  ("C-x M-l" . 'persp-state-load)
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))
  :hook (
    (kill-emacs . persp-state-save))
  :init
  (persp-mode))

(use-package modus-themes)
(use-package dracula-theme)
(use-package doom-themes)
(use-package apropospriate-theme :ensure :defer)
(use-package gruber-darker-theme)
(use-package solaire-mode
  :config
  (solaire-global-mode +1))

(use-package eglot
  :ensure t
  :config
  (electric-pair-mode)
  :hook
  (typescript-ts-mode . eglot-ensure)
  (tsx-ts-mode . eglot-ensure)
  (c-mode . eglot-ensure))

(use-package typescript-ts-mode
  :ensure t
  :after eglot
  :config
  (setq typescript-ts-mode-indent-offset 4))
(use-package prettier-js)
(use-package web-mode)
(use-package yaml-mode)

(use-package hl-line
  :hook
  (org-mode . hl-line-mode)
  (prog-mode . hl-line-mode))

(use-package marginalia
  :config
  (marginalia-mode))

(use-package vertico
  :init
  (vertico-mode))

(use-package consult)

(use-package dashboard
  :config
  (dashboard-setup-startup-hook))

(use-package wgrep)

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package docker-compose-mode)

(use-package terraform-mode
  :hook
  (terraform-mode . outline-minor-mode))

;; Set backup files location
(unless (file-directory-p "~/.saves") (dired-create-directory "~/.saves"))
(setq backup-directory-alist `(("." . "~/.saves"))
      delete-old-versions t)


(display-time)
(global-display-line-numbers-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(load-theme 'gruber-darker t)
(set-face-attribute 'default nil :font "Ubuntu Mono-18")

(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))


(defun setup-gorgias-processes ()
  "Set up a 2x2 grid with three vterm buffers and one scratch buffer."
  (interactive)
  ;; Switch to the gorgias-processes perspective or create it if it does not exist.
  (let ((persp-name "gorgias-processes"))
    (persp-switch persp-name))

  (vterm "*ai-agent*")
  (vterm-send-string "cd ~/Gorgias/ai-agent && npm run dev\n")

  (split-window-vertically)
  (split-window-horizontally)
  (other-window 1)
  (vterm "*helpdesk-web-app*")
  (vterm-send-string "cd ~/Gorgias/helpdesk-web-app && yarn serve\n")

  (split-window-vertically)
  (other-window 1)
  (vterm "*storybook*")
  (vterm-send-string "cd ~/Gorgias/helpdesk-web-app && yarn storybook -- --no-open\n")

  (other-window 1)
  (split-window-horizontally)
  (vterm "*ngrok*")
  (vterm-send-string "cd ~ && ngrok start --all --config ~/Gorgias/ngrok.yml\n")

  (other-window 1)
  (vterm "*workflows*")
  (vterm-send-string "cd ~/gorgias/workflows && npx nx serve api\n")
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("603a831e0f2e466480cdc633ba37a0b1ae3c3e9a4e90183833bc4def3421a961" "0f76f9e0af168197f4798aba5c5ef18e07c926f4e7676b95f2a13771355ce850" default))
 '(package-selected-packages '(evil-collection)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
