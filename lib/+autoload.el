;;; +autoload.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:


;;;### (autoloads nil "cc-x" "cc-x.el" (0 0 0 0))
;;; Generated autoloads from cc-x.el

(autoload 'cc-x-flymake-cc-command "cc-x" nil nil nil)

(autoload 'cc-help "cc-x" nil t nil)

(autoload 'cc-format "cc-x" nil t nil)

(defvar gtags-mode nil "\
Non-nil if gtags mode is enabled.
See the `gtags-mode' command
for a description of this minor mode.")

(custom-autoload 'gtags-mode "cc-x" nil)

(autoload 'gtags-mode "cc-x" "\
Gtags completion at point backend and xref backend enabled mode.

This is a minor mode.  If called interactively, toggle the `gtags
mode' mode.  If the prefix argument is positive, enable the mode,
and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='gtags-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(put 'gtags-mode 'safe-local-variable 'booleanp)

(register-definition-prefixes "cc-x" '("cc-" "global-" "gtags-"))

;;;***

;;;### (autoloads nil "eve" "eve.el" (0 0 0 0))
;;; Generated autoloads from eve.el

(autoload 'eve-change-mode-to-vi "eve" "\
Change mode to Vi." t nil)

(register-definition-prefixes "eve" '("eve-"))

;;;***

;;;### (autoloads nil "listify" "listify.el" (0 0 0 0))
;;; Generated autoloads from listify.el

(autoload 'listify-tab-completion "listify" "\
Tab completion with `listify-completion-in-region'.

\(fn ARG)" t nil)

(autoload 'listify-dabbrev-completion "listify" "\
`dabbrev-completion' with `listify-completion-in-region'." t nil)

(autoload 'listify-open "listify" "\
Open buffer or recent file with `listify-read'.
Open file in current project if ARG not nil.

\(fn ARG)" t nil)

(register-definition-prefixes "listify" '("listify-"))

;;;***

;;;### (autoloads nil "simple-x" "simple-x.el" (0 0 0 0))
;;; Generated autoloads from simple-x.el

(defvar xclip-program "xclip -selection clip")

(autoload 'xclip "simple-x" "\
Xclip wrap for copy regin (BEG . END).

\(fn BEG END)" t nil)

(defvar xdg-open-program "xdg-open")

(autoload 'xdg-open "simple-x" "\
Xdg wrap for open FILE or current file if called interactively.

\(fn &optional FILE)" t nil)

(autoload 'dired-do-xdg-open "simple-x" "\
`xdg-open' files in Dired." t nil)

(defvar rg-program "rg")

(autoload 'rg "simple-x" "\
Ripgrep wrap for `grep-mode'." t nil)

(autoload 'minibuffer-yank-symbol "simple-x" "\
Yank current symbol to minibuffer." t nil)

(autoload 'rotate-window "simple-x" "\
Rotate current window or swap it if called with prefix ARG.

\(fn ARG)" t nil)

(autoload 'eshell-dwim "simple-x" "\
Eshell in new window or other window if called with prefix ARG.

\(fn ARG)" t nil)

(defvar list-misc-prefix-map (let ((map (make-sparse-keymap))) (define-key map "y" 'list-kill-ring) (define-key map "m" 'list-global-mark-ring) (define-key map "i" 'list-imenu) map))

(autoload 'list-kill-ring "simple-x" "\
List `kill-ring'." t nil)

(autoload 'list-global-mark-ring "simple-x" "\
List `global-mark-ring' and `mark-ring' if called with prefix ARG.

\(fn ARG)" t nil)

(autoload 'list-imenu "simple-x" "\
List imenu, force rescan if called with prefix ARG.

\(fn ARG)" t nil)

(register-definition-prefixes "simple-x" '("list-"))

;;;***

(provide '+autoload)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; +autoload.el ends here
