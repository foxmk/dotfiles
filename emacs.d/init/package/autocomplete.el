;;; package/autocomplete.el --- Autocompletion settings

(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories "/Users/tleyden/.emacs.d/ac-dict")
(ac-config-default)

(provide 'package/autocomplete)
