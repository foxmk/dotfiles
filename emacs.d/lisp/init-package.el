;;; init-package.el --- Package management settings

;;; Commentary:

;;; Code:

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

(provide 'init-package)

;;; init-package.el ends here
