;;; init-rust.el --- Rust-mode settings

;;; Commentary:

;;; Code:

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

(provide 'init-rust)

;;; init-rust.el ends here

