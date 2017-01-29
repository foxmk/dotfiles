;;; lang/go.el --- Settings for go-mode

(defun my-go-mode-hook ()

  (require 'go-autocomplete)

  ;; compile command
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go generate && go build -v && go test -v && go vet"))

  ;; el-doc
  (go-eldoc-setup)

  ;; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")

  ;; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)

  ;; Key bindings
  (local-set-key (kbd "C-c C-c") 'compile)
  (local-set-key (kbd "C-c C-i") 'go-goto-imports)
  (local-set-key (kbd "C-c C-k") 'godoc)
  (local-set-key (kbd "M-.") 'godef-jump))

(add-hook 'go-mode-hook 'my-go-mode-hook)

(provide 'lang/go)
