(setq package-enable-at-startup nil)
(setq-default indent-tabs-mode nil)

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

(setq auth-sources '("~/.authinfo.gpg")
      display-line-numbers-type 'relative
      frame-resize-pixelwise t
      mac-option-modifier 'meta
      lexical-binding t)
(global-display-line-numbers-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(use-package exec-path-from-shell)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
(when (daemonp)
  (exec-path-from-shell-initialize))

(setq gc-cons-threshold 100000000)

(setq read-process-output-max (* 1024 1024)) ;; 1mb

(setq evil-want-keybinding nil)
(use-package evil-leader
  :config
  (global-evil-leader-mode))

(use-package evil-collection
  :after evil-leader
  :ensure t
  :config
  (evil-collection-init))

(use-package evil
  :after evil-collection
  :init
  :config
  (setq evil-want-minibuffer t
        evil-undo-system 'undo-redo)
  (evil-mode 1))

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
;; TODO INSTALL ORG MODERN

(use-package vterm
  :init
  (defun vterm-process-query-on-exit ()
    (let ((proc (get-buffer-process (current-buffer))))
      (when proc
        (set-process-query-on-exit-flag proc nil))))
  :hook
    (vterm-mode . vterm-process-query-on-exit)
  :ensure t)

(use-package multi-vterm
   	:config
   	(add-hook 'vterm-mode-hook
   			(lambda ()
   			(setq-local evil-insert-state-cursor 'box)
   			(evil-insert-state)))
   	(define-key vterm-mode-map [return]                      #'vterm-send-return)

   	(setq vterm-keymap-exceptions nil)
   	(evil-define-key 'insert vterm-mode-map (kbd "C-e")      #'vterm--self-insert)
   	(evil-define-key 'insert vterm-mode-map (kbd "C-f")      #'vterm--self-insert)
   	(evil-define-key 'insert vterm-mode-map (kbd "C-a")      #'vterm--self-insert)
   	(evil-define-key 'insert vterm-mode-map (kbd "C-v")      #'vterm--self-insert)
   	(evil-define-key 'insert vterm-mode-map (kbd "C-b")      #'vterm--self-insert)
(evil-define-key 'insert vterm-mode-map (kbd "C-w")      #'vterm--self-insert)
   	(evil-define-key 'insert vterm-mode-map (kbd "C-u")      #'vterm--self-insert)
   	(evil-define-key 'insert vterm-mode-map (kbd "C-d")      #'vterm--self-insert)
   	(evil-define-key 'insert vterm-mode-map (kbd "C-n")      #'vterm--self-insert)
   	(evil-define-key 'insert vterm-mode-map (kbd "C-m")      #'vterm--self-insert)
   	(evil-define-key 'insert vterm-mode-map (kbd "C-p")      #'vterm--self-insert)
   	(evil-define-key 'insert vterm-mode-map (kbd "C-j")      #'vterm--self-insert)
   	(evil-define-key 'insert vterm-mode-map (kbd "C-k")      #'vterm--self-insert)
   	(evil-define-key 'insert vterm-mode-map (kbd "C-r")      #'vterm--self-insert)
   	(evil-define-key 'insert vterm-mode-map (kbd "C-t")      #'vterm--self-insert)
   	(evil-define-key 'insert vterm-mode-map (kbd "C-g")      #'vterm--self-insert)
   	(evil-define-key 'insert vterm-mode-map (kbd "C-c")      #'vterm--self-insert)
   	(evil-define-key 'insert vterm-mode-map (kbd "C-SPC")    #'vterm--self-insert)
   	(evil-define-key 'normal vterm-mode-map (kbd "C-d")      #'vterm--self-insert)
   	(evil-define-key 'normal vterm-mode-map (kbd ",c")       #'multi-vterm)
   	(evil-define-key 'normal vterm-mode-map (kbd ",n")       #'multi-vterm-next)
   	(evil-define-key 'normal vterm-mode-map (kbd ",p")       #'multi-vterm-prev)
   	(evil-define-key 'normal vterm-mode-map (kbd "i")        #'evil-insert-resume)
   	(evil-define-key 'normal vterm-mode-map (kbd "o")        #'evil-insert-resume)
   	(evil-define-key 'normal vterm-mode-map (kbd "<return>") #'evil-insert-resume))

(use-package ansi-color
  :config
  (defun colorize-ansi-compilation-buffer ()
    (when (eq major-mode 'compilation-mode)
      (ansi-color-apply-on-region compilation-filter-start (point-max))))
  :hook
  (compilation-filter . colorize-ansi-compilation-buffer))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package ace-window
  :ensure t
  :bind ("M-o" . 'ace-window))

(use-package magit
  :commands (magit-status magit-get-current-branch)
  :config
    (setq display-line-numbers-type 'visual)
    (global-display-line-numbers-mode t)
    (setq magit-section-disable-line-numbers nil)
    (setq magit-process-finish-apply-ansi-colors t)
    (evil-define-key 'normal magit-section-mode-map (kbd "1") nil)
    (evil-define-key 'normal magit-section-mode-map (kbd "2") nil)
    (evil-define-key 'normal magit-section-mode-map (kbd "3") nil)
    (evil-define-key 'normal magit-section-mode-map (kbd "4") nil)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))
(use-package forge
  :after magit
  :config
  (setq forge-add-default-bindings nil))
(use-package emojify
  :ensure t)

(use-package org-wild-notifier
  :ensure t
  :config
  (setq alert-default-style 'osx-notifier)
  :init
  (org-wild-notifier-mode))

(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . gfm-mode)
  :commands (markdown-mode gfm-mode)
  :config
  (setq markdown-command "pandoc -t html5"))

(use-package copilot
  :straight (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
  :ensure t
  :bind 
  ("M-]" . 'copilot-accept-completion)
  ("M-[" . 'copilot-accept-completion-by-word)
  ;;:hook (prog-mode . copilot-mode)
  :config
  (add-to-list 'copilot-indentation-alist '(org-mode 2))
  ;;:init
  ;;(copilot-mode)
  )

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

(use-package modus-themes :defer)
(use-package dracula-theme :defer)
(use-package doom-themes
  :ensure t
  :defer
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))
(use-package apropospriate-theme :ensure :defer)
(use-package gruber-darker-theme)

;; (use-package circadian
;;   :ensure t
;;   :config
;;   (setq calendar-latitude 48.8)
;;   (setq calendar-longitude 2.35)
;;   (setq circadian-themes '(
;; 			   ;;(:sunrise . doom-one-light)
;; 			   (:sunrise . apropospriate-light)
;; 			   ;;(:sunset  . modus-vivendi)
;; 			   (:sunset  . dracula)
;; 			   ))
;;   ;;(circadian-setup)
;;   :hook
;;   (circadian-after-load-theme-hook . (lambda (theme)
;;               ;;Cursor
;;               (set-default 'cursor-type 'box)
;;               (set-cursor-color "#F52503"))))

(load-theme 'gruber-darker t)

(defun kill-other-buffers ()
   "Kill all other buffers."
   (interactive)
   (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))

(use-package typescript-ts-mode
  :ensure t
  :after eglot
  :config
  (setq typescript-ts-mode-indent-offset 4))

(use-package web-mode)

(use-package eglot
  :ensure t
  :config
  (electric-pair-mode)
  :hook
  (typescript-ts-mode . eglot-ensure)
  (tsx-ts-mode . eglot-ensure)
  (c-mode . eglot-ensure))

(use-package git-link)

(use-package marginalia
  :config
  (marginalia-mode))
(use-package vertico
  :init
  (vertico-mode))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  (setq read-extended-command-predicate
    #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package consult
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :bind (;; C-c bindings in `mode-specific-map'
         ("C-c M-x" . consult-mode-command)
         ("C-c h" . consult-history)
         ("C-c k" . consult-kmacro)
         ("C-c m" . consult-man)
         ("C-c i" . consult-info)
         ([remap Info-search] . consult-info)
         ;; C-x bindings in `ctl-x-map'
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ("C-x t b" . consult-buffer-other-tab)    ;; orig. switch-to-buffer-other-tab
         ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
         ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ;; M-g bindings in `goto-map'
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings in `search-map'
         ("M-s d" . consult-find)                  ;; Alternative: consult-fd
         ("M-s c" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
         ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history)                 ;; orig. next-matching-history-element
         ("M-r" . consult-history))                ;; orig. previous-matching-history-element

  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key "M-.")
  ;; (setq consult-preview-key '("S-<down>" "S-<up>"))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   ;; :preview-key "M-."
   :preview-key '(:debounce 0.4 any))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; "C-+"

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (define-key consult-narrow-map (vconcat consult-narrow-key "?") #'consult-narrow-help)

  ;; By default `consult-project-function' uses `project-root' from project.el.
  ;; Optionally configure a different project root function.
  ;;;; 1. project.el (the default)
  ;; (setq consult-project-function #'consult--default-project--function)
  ;;;; 2. vc.el (vc-root-dir)
  ;; (setq consult-project-function (lambda (_) (vc-root-dir)))
  ;;;; 3. locate-dominating-file
  ;; (setq consult-project-function (lambda (_) (locate-dominating-file "." ".git")))
  ;;;; 4. projectile.el (projectile-project-root)
  ;; (autoload 'projectile-project-root "projectile")
  ;; (setq consult-project-function (lambda (_) (projectile-project-root)))
  ;;;; 5. No project support
  ;; (setq consult-project-function nil)
)

(add-to-list 'default-frame-alist '(font . "Ubuntu Mono"))
(set-face-attribute 'default nil :font "Ubuntu Mono-20")

(use-package project
  :ensure nil ; project is built-in, no need to download
  :config
  (defun my/project-find-function (dir)
    "Identify a project root by the presence of a .project file."
    (let ((root (locate-dominating-file dir ".project")))
      (and root (cons 'transient root))))
  (setq project-switch-commands
        '((project-find-file "Find file" ?f)
          (project-find-regexp "Find regexp" ?r)
          (project-dired "Dired" ?d)
          (magit-project-status "Magit" ?m)
          (multi-vterm "Vterm" ?t)
          ))
  (add-to-list 'project-find-functions 'my/project-find-function)
  (bind-keys :map project-prefix-map
             ("t" . multi-vterm-dedicated-toggle)))

(defun scale-text (delta)
  "Scales the font size in all windows"
  (interactive "nAdjust font height by (tenths of a point): ")
  (let* ((current-height (face-attribute 'default :height))
         (new-height (+ current-height delta)))
    (set-face-attribute 'default (selected-frame) :height new-height)))

(use-package imenu-list
  :bind ("C-'" . imenu-list-smart-toggle))

(use-package drag-stuff
  :config
  (setq drag-stuff-global-mode 1))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-major-mode-icon t
	doom-modeline-major-mode-color-icon t
	doom-modeline-buffer-state-icon t
	doom-modeline-buffer-modification-icon t
	doom-modeline-lsp-icon t
	doom-modeline-time-icon nil
	doom-modeline-time-analogue-clock t
	doom-modeline-time-clock-size 0.7
	doom-modeline-highlight-modified-buffer-name t
        doom-modeline-project-detection 'auto))



(use-package corfu
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  (corfu-separator ?\s)          ;; Orderless field separator
  (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  (corfu-preview-current nil)    ;; Disable current candidate preview
  (corfu-preselect 'directory)      ;; Preselect the prompt
  (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  (corfu-scroll-margin 5)        ;; Use scroll margin

  :hook ((prog-mode . corfu-mode)
         (shell-mode . corfu-mode)
         (vterm-mode . corfu-mode)
         (eshell-mode . corfu-mode))
  :bind
  (:map corfu-map
        ("TAB" . corfu-next)
        ([tab] . corfu-next)
        ("S-TAB" . corfu-previous)
        ([backtab] . corfu-previous))
  :init
  (global-corfu-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  (setq tab-always-indent 'complete)
  (setq text-mode-ispell-word-completion nil)
  (setq read-extended-command-predicate #'command-completion-default-include-p))

;; Use Dabbrev with Corfu!
(use-package dabbrev
  ;; Swap M-/ and C-M-/
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand))
  :config
  (add-to-list 'dabbrev-ignored-buffer-regexps "\\` ")
  ;; Since 29.1, use `dabbrev-ignored-buffer-regexps' on older.
  (add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(defun corfu-enable-in-minibuffer ()
  "Enable Corfu in the minibuffer."
  (when (local-variable-p 'completion-at-point-functions)
    ;; (setq-local corfu-auto nil) ;; Enable/disable auto completion
    (setq-local corfu-echo-delay nil ;; Disable automatic echo and popup
                corfu-popupinfo-delay nil)
    (corfu-mode 1)))
(add-hook 'minibuffer-setup-hook #'corfu-enable-in-minibuffer)

(defun corfu-move-to-minibuffer ()
  (interactive)
  (pcase completion-in-region--data
    (`(,beg ,end ,table ,pred ,extras)
     (let ((completion-extra-properties extras)
           completion-cycle-threshold completion-cycling)
       (consult-completion-in-region beg end table pred)))))
(keymap-set corfu-map "M-m" #'corfu-move-to-minibuffer)
(add-to-list 'corfu-continue-commands #'corfu-move-to-minibuffer)

(use-package embark
  :ensure t

  :bind
  (("C->" . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t ; only need to install it, embark loads it after consult if found
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package fic-mode
  :hook
  (prog-mode . fic-mode))

(use-package yaml-mode)

(use-package hl-line
  :hook
  (org-mode . hl-line-mode)
  (prog-mode . hl-line-mode))

(use-package solaire-mode
  :config
  (solaire-global-mode +1))

(use-package wgrep)

(use-package origami
  :config (global-origami-mode t))

;; (use-package highlight-indent-guides
;;   :ensure t
;;   :hook (prog-mode . highlight-indent-guides-mode)
;;   :config
;;   (setq highlight-indent-guides-method 'bitmap
;; 	highlight-indent-guides-responsive 'nil))

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
(unless (f-directory-p "~/.saves") (dired-create-directory "~/.saves"))
(setq backup-directory-alist `(("." . "~/.saves"))
      delete-old-versions t)

(bind-key "s-w" 'kill-this-buffer)

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
  (vterm "*neofetch*")
  (vterm-send-string "neofetch\n")
)

(use-package prettier-js)

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
