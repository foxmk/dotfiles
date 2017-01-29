(setq debug-on-error t)

;;; init.el --- Main config file

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(setq inhibit-startup-message t)

;; Package manager
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Cask
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

;; pallet-mode
(require 'pallet)
(pallet-mode t)

;; Setup `load-path'
(defvar foxmk/init-directory (concat user-emacs-directory "init/"))
(add-to-list 'load-path foxmk/init-directory)

(defvar foxmk/contrib-directory (concat user-emacs-directory "contrib/"))
(let ((default-directory foxmk/contrib-directory))
  (normal-top-level-add-subdirs-to-load-path))

;; Custom file
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

;; Require config files
(require 'common/defuns)
(require 'common/global)
(require 'common/appearance)

(require 'package/magit)
(require 'package/powerline)
(require 'package/helm)
(require 'package/autocomplete)
(require 'package/evil)
;(require 'package/deft)

;; Language settings
(require 'lang/go)

;; Keybinding at last
(require 'common/keys)

(setq current-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(reverse-input-method 'russian-computer)
(cd "~")
