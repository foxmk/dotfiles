;;; init.el --- Initial config

;;; Commentary:

; (package-initialize)

;;; Code:

;;; Initial settings
(defun find-brew-prefix ()
  "Find Homebrew prefix."
  (substring (shell-command-to-string "brew --prefix") 0 -1))
(defvar brew-prefix (find-brew-prefix))

(setenv "SHELL" (concat brew-prefix "/bin/zsh"))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;; Cask
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

;;; Pallet
(unless (package-installed-p 'pallet)
  (package-refresh-contents)
  (package-install 'pallet))
(require 'pallet)
(pallet-mode t)

;;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-always-ensure t)
(require 'use-package)
(use-package diminish)

;;; GUI
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

(setq mac-command-modifier 'super)

;;; Common keys
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;; Evil-mode
(use-package evil
  :config
  (evil-mode t)
  (use-package evil-magit :requires magit))

;;; Ivy/Counsel/Swiper
(use-package counsel
  :demand
  :bind
  (("C-s" . swiper)
   ("C-x b" . counsel-ibuffer)
   ("C-x m" . counsel-M-x))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "))

;;; Smartparens
(use-package smartparens
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-strict-mode 1)
    (use-package evil-smartparens
      :init
      (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode))))

;;; Company-mode
(use-package company
  :diminish
  :init
  (setq company-tooltip-align-annotations t)
  :config
  (add-hook 'after-init-hook 'global-company-mode))

;;; Magit
(use-package magit
  :bind
  (("C-x g" . magit-status)))

;;; Projectile
(use-package projectile
  :diminish projectile-mode
  :defer 5
  :init
  (setq projectile-completion-system 'ivy)
  :config
  (projectile-mode))

;;; Flycheck
(use-package flycheck
  :defer 1
  :config
  (global-flycheck-mode))

;;; Rust
(use-package rust-mode
  :mode "\\.rs\\'"
  :init
  (setq rust-format-on-save t
        exec-path (append exec-path '("~/.cargo/bin")))
  :config
  (use-package cargo :defer)
  (use-package flycheck-rust :commands flycheck-rust-setup)
  (use-package racer
    :requires company-mode
    :defer t
    :config
    (add-hook 'racer-mode-hook #'company-mode)
    (local-set-key (kbd "TAB") #'company-indent-or-complete-common))
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'rust-mode-hook #'cargo-minor-mode)
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;;; GLSL
(use-package glsl-mode
  :mode "\\.glsl.\\'"
  :config
  (use-package company-glsl
    :requires company
    :config
    (add-to-list 'company-backends 'company-glsl)))

;;; Footer
(provide 'init)

;;; init.el ends here
