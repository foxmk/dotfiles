;;; init-ivy.el --- Ivy/Counsel settings

;;; Commentary:

;;; Code:

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
   ("C-x b" . counsel-ibuffer)
   ("C-x m" . counsel-M-x)))

(provide 'init-ivy)

;;; init-ivy.el ends here
