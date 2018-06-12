;;; init.el --- Initial config

;;; Commentary:

;;; Code:

; (package-initialize)

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

(progn
  (unless (package-installed-p 'pallet)
    (package-refresh-contents)
    (package-install 'pallet))
  (require 'pallet)
  (pallet-mode t))

(progn
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
  (setq use-package-always-ensure t)
  (require 'use-package))

(defun find-brew-prefix ()
  "Find Homebrew prefix."
  (substring (shell-command-to-string "brew --prefix") 0 -1))

(progn
  (defvar brew-prefix (find-brew-prefix))
  (setenv "SHELL" (concat brew-prefix "/bin/zsh")))

(progn
  (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
  (when (file-exists-p custom-file) (load custom-file)))

(progn
  (when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
  (when (fboundp 'horizontal-scroll-bar-mode) (horizontal-scroll-bar-mode -1)))

(progn
  (show-paren-mode 1)
  (setq mac-command-modifier 'super
        save-interprogram-paste-before-kill t
        require-final-newline t
        load-prefer-newer t
        backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))
  (setq visible-bell nil
        ring-bell-function 'ignore)
  (setq initial-scratch-message "")
  (setf inhibit-splash-screen t)
  (global-hl-line-mode 1)
  (fset 'yes-or-no-p 'y-or-n-p)
  (set-frame-font "SF Mono"))

(use-package diminish :defer t)

(use-package uniquify
  :ensure nil
  :init
  (setq uniquify-buffer-name-style 'forward))

(use-package saveplace
  :init
  (setq-default save-place t)
  (setq save-place-file (concat user-emacs-directory "places")))

(use-package zenburn-theme
  :config
  (load-theme 'zenburn))

(use-package which-key
  :diminish
  :init
  (setq which-key-popup-type 'minibuffer
        which-key-idle-delay 0.4)
  :config
  (which-key-setup-minibuffer)
  (which-key-mode))

(use-package evil
  :config
  (evil-mode t))

(use-package evil-nerd-commenter
  :after evil
  :config
  (evilnc-default-hotkeys))

(use-package evil-surround
  :after evil
  :config
  (global-evil-surround-mode 1))

(use-package evil-visualstar
  :after evil
  :init
  (setq evil-visualstar/persistent nil)
  :config
  (global-evil-visualstar-mode))

(use-package evil-escape
  :after evil
  :init
  (setq-default evil-escape-key-sequence "jk")
  :config
  (evil-escape-mode))

(use-package evil-magit
  :after (evil magit))

(use-package general
  :after (evil which-key)
  :config
  (general-evil-setup t)
  (general-setq evil-want-Y-yank-to-eol t
                evil-search-module 'evil-search)
  (general-auto-unbind-keys)
  (general-create-definer my-leader-define-key
    :prefix "SPC"
    :states '(normal motion emacs)))

(use-package smartparens
  :diminish smartparens-mode
  :config
  (require 'smartparens-config)
  (smartparens-global-strict-mode 1))

(use-package evil-smartparens
  :after (evil smartparens)
  :commands (evil-smartparens-mode)
  :init
  (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode))

(use-package ivy
  :diminish
  :init
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) ")
  :config
  (ivy-mode 1))

(use-package counsel
  :demand
  :bind
  (("C-s" . swiper)
   ("C-x C-b" . ibuffer)
   ("C-x b" . counsel-ibuffer)
   ("C-x m" . counsel-M-x)))

(use-package company
  :diminish
  :init
  (setq company-tooltip-align-annotations t)
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package magit
  :after general
  :config
  (my-leader-define-key
    "g" '(:ignore t :which-key "Git")
    "gs" 'magit-status))

(use-package projectile
  :diminish projectile-mode
  :after general
  :init
  (setq projectile-completion-system 'ivy)
  :config
  (projectile-mode)
  (my-leader-define-key
    "p" '(:ignore t :which-key "Projectile")
    "ps" 'projectile-switch-project))

(use-package flycheck
  :defer 1
  :config
  (global-flycheck-mode))

(use-package rust-mode
  :mode "\\.rs\\'"
  :init
  (setq rust-format-on-save t
        exec-path (append exec-path '("~/.cargo/bin"))))

(use-package racer
  :after (rust-mode company-mode)
  :init
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  :config
  (local-set-key (kbd "TAB") #'company-indent-or-complete-common))

(use-package flycheck-rust
  :after (rust-mode flycheck)
  :commands flycheck-rust-setup
  :init
  (add-hook 'rust-mode-hook 'flycheck-rust-setup))

(use-package cargo
  :after rust-mode
  :init
  (add-hook 'rust-mode-hook 'cargo-minor-mode))

(use-package glsl-mode
  :mode "\\.glsl.\\'")

(use-package company-glsl
  :after (company glsl-mode)
  :config
  (add-to-list 'company-backends 'company-glsl))

;;; Footer
(provide 'init)

;;; init.el ends here
