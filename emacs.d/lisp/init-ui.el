;;; init-ui.el --- UI settings

;;; Commentary:

;;; Code:

(progn
  (when (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
  (when (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
  (when (fboundp 'horizontal-scroll-bar-mode)
    (horizontal-scroll-bar-mode -1)))

(use-package uniquify
  :ensure nil
  :init
  (setq uniquify-buffer-name-style 'forward))

(use-package saveplace
  :init
  (setq-default save-place t)
  (setq save-place-file (concat user-emacs-directory "places")))

(show-paren-mode 1)

(setq visible-bell       nil
      ring-bell-function #'ignore
      save-interprogram-paste-before-kill t
      apropos-do-all t
      require-final-newline t
      load-prefer-newer t
      backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

(use-package zenburn-theme
  :config
  (load-theme 'zenburn))

(set-frame-font "SF Mono")

(use-package which-key
  :diminish
  :init
  (setq which-key-popup-type 'minibuffer
	which-key-idle-delay 0.6)
  :config
  (which-key-setup-minibuffer)
  (which-key-mode))

(provide 'init-ui)

;;; init-ui.el ends here
