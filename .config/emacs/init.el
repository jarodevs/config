(setenv "LIBRARY_PATH"
      (string-join
       '("/opt/homebrew/opt/gcc/lib/gcc/14"
	 "/opt/homebrew/opt/libgccjit/lib/gcc/14"
	 "/opt/homebrew/opt/gcc/lib/gcc/14/gcc/aarch64-apple-darwin23/14")
       ":"))
(load-file (expand-file-name "lisp/straight.el" user-emacs-directory))
(load-file (expand-file-name "lisp/evil.el" user-emacs-directory))
(load-file (expand-file-name "lisp/appearance.el" user-emacs-directory))
(load-file (expand-file-name "lisp/minibuffer.el" user-emacs-directory))
(load-file (expand-file-name "lisp/org.el" user-emacs-directory))
(load-file (expand-file-name "lisp/help-utilities.el" user-emacs-directory))
(load-file (expand-file-name "lisp/magit.el" user-emacs-directory))
(load-file (expand-file-name "lisp/coding.el" user-emacs-directory))
(load-file (expand-file-name "lisp/miscellaneous.el" user-emacs-directory))
