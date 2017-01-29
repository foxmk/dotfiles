;;; common/defuns.el -- Custom functions

;; Borrowed from http://whattheemacsd.com/key-bindings.el-01.html
(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

;; Edit config
(defun edit-config-file (filename)
  "Create or edit emacs config file. Calling this function with empty string opens `init.el'"
  (interactive "sConfig name: ")
  (if (= (length filename) 0)
    (find-file (concat user-emacs-directory "init.el"))
    (let
      ((full-path (concat user-emacs-directory "init/" filename ".el")))
      (if (file-exists-p full-path)
        (find-file full-path)
        (progn
         (find-file full-path)
         (insert (format ";;; %s.el --- \n\n(provide '%s)" filename filename))
         (goto-char (point-min))
         (goto-char (end-of-line)))))))

;; Fix for non-english layouts
(defun reverse-input-method (input-method)
  "Build the reverse mapping of single letters from INPUT-METHOD."
  (interactive
   (list (read-input-method-name "Use input method (default current): ")))
  (if (and input-method (symbolp input-method))
      (setq input-method (symbol-name input-method)))
  (let ((current current-input-method)
        (modifiers '(nil (control) (meta) (control meta))))
    (when input-method
      (activate-input-method input-method))
    (when (and current-input-method quail-keyboard-layout)
      (dolist (map (cdr (quail-map)))
        (let* ((to (car map))
               (from (quail-get-translation
                      (cadr map) (char-to-string to) 1)))
          (when (and (characterp from) (characterp to))
            (dolist (mod modifiers)
              (define-key local-function-key-map
                (vector (append mod (list from)))
                (vector (append mod (list to)))))))))
    (when input-method
      (activate-input-method current))))

;; Taken from: https://github.com/rmm5t/dotfiles/blob/master/emacs.d/personal/defuns.el
(defun insert-file-name ()
  "Insert the full path file name into the current buffer."
  (interactive)
  (insert (buffer-file-name (window-buffer (minibuffer-selected-window)))))

;; Quickly jump back and forth between matching parens/brackets
;; Taken from: https://github.com/rmm5t/dotfiles/blob/master/emacs.d/personal/defuns.el
(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))))

;; Make the whole buffer pretty and consistent
;; Taken from: https://github.com/rmm5t/dotfiles/blob/master/emacs.d/personal/defuns.el
(defun prettify-buffer ()
  "Indent Whole Buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

;; System-specific code
(defmacro with-system (type &rest body)
  "Evaluate body if `system-type' equals type."
  (declare (indent defun))
  `(when (eq system-type ',type)
     ,@body))

(provide 'common/defuns)
