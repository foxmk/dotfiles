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

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-package)
(require 'init-ui)
(require 'init-keys)
(require 'init-evil)
(require 'init-ivy)
(require 'init-company)
(require 'init-magit)
(require 'init-projectile)
(require 'init-flycheck)

;;; Major modes
(require 'init-rust)
(require 'init-glsl)

;;; Footer
(provide 'init)

;;; init.el ends here
