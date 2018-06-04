;;; init-glsl.el --- GLSL mode settings

;;; Commentary:

;;; Code:

(use-package glsl-mode
  :mode "\\.glsl.\\'"
  :config
  (use-package company-glsl
    :requires company
    :config
    (add-to-list 'company-backends 'company-glsl)))

(provide 'init-glsl)

;;; init-glsl.el ends here
