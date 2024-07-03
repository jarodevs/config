;;(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
;;(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))

;;(use-package yasnippet
  ;;:ensure t
  ;;:config
  ;;(yas-global-mode 1))

;;(use-package dashboard
  ;;:config
  ;;(dashboard-setup-startup-hook))

;;(use-package wgrep)

;;(use-package treesit-auto
  ;;:custom
  ;;(treesit-auto-install 'prompt)
  ;;:config
  ;;(treesit-auto-add-to-auto-mode-alist 'all)
  ;;(global-treesit-auto-mode))

;;(use-package docker-compose-mode)

;;(use-package terraform-mode
  ;;:hook
  ;;(terraform-mode . outline-minor-mode))

;;(use-package ansi-color
  ;;:config
  ;;(defun compilation-buffer-support-ansi ()
    ;;(when (wq major-mode 'compilation-mode)
      ;;(ansi-color-apply-on-region compilation-filter-start (point-max)))
    ;;)
  ;;:hook
  ;;(compilation-filter . compilation-buffer-support-ansi))
;;

;;;; MODELINE
;;(use-package marginalia
  ;;:config
  ;;(marginalia-mode))

;;(use-package vertico
  ;;:init
  ;;(vertico-mode))

;;(use-package consult)
