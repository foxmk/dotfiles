;;; init-projectile.el --- Projectile settings

;;; Commentary:

;;; Code:

(use-package projectile
  :diminish projectile-mode
  :defer 5
  :init
  (setq projectile-completion-system 'ivy)
  :config
  (projectile-mode))

(provide 'init-projectile)

;;; init-projectile.el ends here
