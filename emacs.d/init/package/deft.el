;;; package/deft.el --- Config for deft module

(require 'deft)

(setq deft-extensions '("txt" "tex" "org" "md" "html"))
(setq deft-directory "~/Dropbox/org")

(setq deft-recursive t)
(global-set-key [f8] 'deft)

(setq deft-use-filename-as-title t)

(provide 'package/deft)
