;;; common/appearance.el --- Color theme settings

(setq ns-pop-up-frames nil)

(load-theme 'monokai)

(set-cursor-color "orange")
(set-face-attribute 'region nil :background "cornflower blue")
(set-face-attribute 'lazy-highlight nil :background "dark goldenrod" :foreground "white")

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; (with-system darwin
;;   (set-face-font 'default "Monaco-12"))

(with-system windows-nt
  (set-face-font 'default "Consolas-10"))

(provide 'common/appearance)
