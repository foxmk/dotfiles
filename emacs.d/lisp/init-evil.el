;;; init-evil.el --- Evil-mode settings

;;; Commentary:

;;; Code:

(use-package evil
  :config
  (evil-mode t)
  (use-package evil-magit :requires magit)
  (use-package evil-escape
    :init
    (setq-default evil-escape-key-sequence "jk")
    :config
    (evil-escape-mode)))

(use-package general
  :config
  (general-evil-setup t)

  (general-define-key
    :states '(normal motion)
    :prefix "SPC"
    "gs" 'magit-status))

(use-package smartparens
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-strict-mode 1)
    (use-package evil-smartparens
      :init
      (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode))))

(provide 'init-evil)

;;; init-evil.el ends here
