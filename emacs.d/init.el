;;; Cask
; (package-initialize)
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

;;; Pallet
(require 'pallet)
(pallet-mode t)

;;; GUI
(use-package better-defaults
  :config
  (menu-bar-mode t))
(load-theme 'solarized-light)

;;; Evil-mode
(use-package evil
  :config
  (evil-mode t))

;;; Helm
(use-package helm-config
  :config
  (helm-mode t)
  (setq helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match    t)
  :bind
  (("M-x"     . helm-M-x)
   ("M-y"     . helm-show-kill-ring)
   ("C-x b"   . helm-mini)
   ("C-x C-f" . helm-find-files)))

;;; Magit
(use-package magit
  :bind
  (("C-x g" . magit-status)))




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(package-selected-packages
   (quote
    (solarized-theme magit req-package pallet helm-swoop evil better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
