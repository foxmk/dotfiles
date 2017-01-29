;;; common/keys.el -- Keybindings

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-l") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)
(global-unset-key (kbd "C-<down-mouse-1>"))
(global-set-key (kbd "C-<mouse-1>") 'mc/add-cursor-on-click)

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; Russian keys
(global-set-key (kbd "A-<space>") 'reverse-input-method)

;; Familiar keys
(cua-mode)
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-S-f") 'isearch-forward-regexp)
(global-set-key (kbd "C-S-p") 'helm-M-x)

;; Windows keys
(with-system windows-nt
  (global-set-key (kbd "M-<f4>") 'save-buffers-kill-terminal))

;; Mac keys
(with-system darwin
  (global-set-key (kbd "<f13>") 'helm-M-x)
  (global-set-key (kbd "A-c") 'kill-ring-save)
  (global-set-key (kbd "A-x") 'kill-region)
  (global-set-key (kbd "A-v") 'yank)
  (global-set-key (kbd "A-<right>") 'forward-word)
  (global-set-key (kbd "A-<left>") 'backward-word)
  (global-set-key (kbd "A-<backspace>") 'backward-kill-word))

(provide 'common/keys)
