;;; common/global.el --- Global configurations

;; Use command as the meta key; option key as super
(setq ns-command-modifier 'meta)
(setq ns-option-modifier  'super)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight regions and add special behaviors to regions.
;; "C-h d transient" for more info
(setq transient-mark-mode t)
(pending-delete-mode t)

;; Display line and column numbers
(setq line-number-mode    t)
(setq column-number-mode  t)

;; Small fringes
(set-fringe-mode '(1 . 1))

;; Explicitly show the end of a buffer
(set-default 'indicate-empty-lines t)

;; Line-wrapping
(set-default 'fill-column 78)

;; Prevent the annoying beep on errors
(setq visible-bell t)

;; Make sure all backup files only live in one place
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

;; Gotta see matching parens
(show-paren-mode t)

;; Don't truncate lines
(setq truncate-lines t)
(setq truncate-partial-width-windows nil)

;; For emacsclient
; (server-start)

;; Trash can support
(setq delete-by-moving-to-trash t)

;; visual-line mode
(visual-line-mode 1)

;; zap-up-to-char, forward-to-word, backward-to-word, etc
(require 'misc)

;; Highlight current line
(global-hl-line-mode)

;; Line numbers
(setq linum-format " %3d ")
(global-linum-mode 1)

;; UTF-8 settings
(require 'un-define "un-define" t)
(set-buffer-file-coding-system 'utf-8 'utf-8-unix)
(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-default default-buffer-file-coding-system 'utf-8-unix)

;; `saveplace.el'
(require 'saveplace)
(setq save-place-file (concat user-emacs-directory "places"))
(setq-default save-place t)

;; Indent with spaces
(setq-default indent-tabs-mode nil)

;; Final newline
(setq require-final-newline t)

;; Trailing whitespace is unnecessary
(defvar whitespace-cleanup-on-save t)
(add-hook 'before-save-hook
          (lambda ()
            (if whitespace-cleanup-on-save (whitespace-cleanup))))

;; Unique buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Persistent session
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;; `drag-stuff.el'
(require 'drag-stuff)
(drag-stuff-global-mode t)
(setq drag-stuff-modifier '(meta control))

;; `smartparens.el'
(require 'smartparens-config)
(smartparens-global-mode t)

;; Indentation
(define-key global-map (kbd "RET") 'newline-and-indent)
(electric-indent-mode 1)

(require 'common/defuns) ; for `with-system' macro

;; Use `gls' on OS X
(with-system darwin
 (setq insert-directory-program (executable-find "gls")))

;; `brew install aspell --lang=en` (instead of ispell)
(with-system darwin
  (setq-default ispell-program-name "aspell")
  (setq ispell-list-command "list")
  (setq ispell-extra-args '("--sug-mode=ultra")))

;; PATH from system
(with-system darwin
  (exec-path-from-shell-initialize))

;; Save frame size on exit
; (require 'save-frame-size)

(provide 'common/global)
