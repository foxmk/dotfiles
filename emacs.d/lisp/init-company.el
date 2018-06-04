;;; init-company.el --- Company-mode settings

;;; Commentary:

;;; Code:

(use-package company
  :diminish
  :init
  (setq company-tooltip-align-annotations t)
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(provide 'init-company)

;;; init-company.el ends here
