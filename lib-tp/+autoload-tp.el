;;; +autoload-tp.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:


;;;### (autoloads nil "company" "company.el" (0 0 0 0))
;;; Generated autoloads from company.el

(autoload 'company-mode "company" "\
\"complete anything\"; is an in-buffer completion framework.
Completion starts automatically, depending on the values
`company-idle-delay' and `company-minimum-prefix-length'.

This is a minor mode.  If called interactively, toggle the
`Company mode' mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `company-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

Completion can be controlled with the commands:
`company-complete-common', `company-complete-selection', `company-complete',
`company-select-next', `company-select-previous'.  If these commands are
called before `company-idle-delay', completion will also start.

Completions can be searched with `company-search-candidates' or
`company-filter-candidates'.  These can be used while completion is
inactive, as well.

The completion data is retrieved using `company-backends' and displayed
using `company-frontends'.  If you want to start a specific backend, call
it interactively or use `company-begin-backend'.

By default, the completions list is sorted alphabetically, unless the
backend chooses otherwise, or `company-transformers' changes it later.

regular keymap (`company-mode-map'):

\\{company-mode-map}
keymap during active completions (`company-active-map'):

\\{company-active-map}

\(fn &optional ARG)" t nil)

(put 'global-company-mode 'globalized-minor-mode t)

(defvar global-company-mode nil "\
Non-nil if Global Company mode is enabled.
See the `global-company-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-company-mode'.")

(custom-autoload 'global-company-mode "company" nil)

(autoload 'global-company-mode "company" "\
Toggle Company mode in all buffers.
With prefix ARG, enable Global Company mode if ARG is positive;
otherwise, disable it.

If called from Lisp, toggle the mode if ARG is `toggle'.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Company mode is enabled in all buffers where `company-mode-on' would
do it.

See `company-mode' for more information on Company mode.

\(fn &optional ARG)" t nil)

(autoload 'company-manual-begin "company" nil t nil)

(autoload 'company-complete "company" "\
Insert the common part of all candidates or the current selection.
The first time this is called, the common part is inserted, the second
time, or when the selection has been changed, the selected candidate is
inserted." t nil)

(register-definition-prefixes "company" '("company-"))

;;;***

;;;### (autoloads nil "company-capf" "company-capf.el" (0 0 0 0))
;;; Generated autoloads from company-capf.el

(register-definition-prefixes "company-capf" '("company-"))

;;;***

;;;### (autoloads nil "eglot" "eglot.el" (0 0 0 0))
;;; Generated autoloads from eglot.el

(autoload 'eglot "eglot" "\
Manage a project with a Language Server Protocol (LSP) server.

The LSP server of CLASS is started (or contacted) via CONTACT.
If this operation is successful, current *and future* file
buffers of MANAGED-MAJOR-MODE inside PROJECT become \"managed\"
by the LSP server, meaning information about their contents is
exchanged periodically to provide enhanced code-analysis via
`xref-find-definitions', `flymake-mode', `eldoc-mode',
`completion-at-point', among others.

Interactively, the command attempts to guess MANAGED-MAJOR-MODE
from current buffer, CLASS and CONTACT from
`eglot-server-programs' and PROJECT from
`project-find-functions'.  The search for active projects in this
context binds `eglot-lsp-context' (which see).

If it can't guess, the user is prompted.  With a single
\\[universal-argument] prefix arg, it always prompt for COMMAND.
With two \\[universal-argument] prefix args, also prompts for
MANAGED-MAJOR-MODE.

PROJECT is a project object as returned by `project-current'.

CLASS is a subclass of `eglot-lsp-server'.

CONTACT specifies how to contact the server.  It is a
keyword-value plist used to initialize CLASS or a plain list as
described in `eglot-server-programs', which see.

LANGUAGE-ID is the language ID string to send to the server for
MANAGED-MAJOR-MODE, which matters to a minority of servers.

INTERACTIVE is t if called interactively.

\(fn MANAGED-MAJOR-MODE PROJECT CLASS CONTACT LANGUAGE-ID &optional INTERACTIVE)" t nil)

(autoload 'eglot-ensure "eglot" "\
Start Eglot session for current buffer if there isn't one." nil nil)

(put 'eglot-workspace-configuration 'safe-local-variable 'listp)

(register-definition-prefixes "eglot" '("eglot-"))

;;;***

;;;### (autoloads nil "emmet-mode" "emmet-mode.el" (0 0 0 0))
;;; Generated autoloads from emmet-mode.el

(autoload 'emmet-expand-line "emmet-mode" "\
Replace the current line's emmet expression with the corresponding expansion.
If prefix ARG is given or region is visible call `emmet-preview' to start an
interactive preview.

Otherwise expand line directly.

For more information see `emmet-mode'.

\(fn ARG)" t nil)

(autoload 'emmet-mode "emmet-mode" "\
Minor mode for writing HTML and CSS markup.
With emmet for HTML and CSS you can write a line like

This is a minor mode.  If called interactively, toggle the `Emmet
mode' mode.  If the prefix argument is positive, enable the mode,
and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `emmet-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

  ul#name>li.item*2

and have it expanded to

  <ul id=\"name\">
    <li class=\"item\"></li>
    <li class=\"item\"></li>
  </ul>

This minor mode defines keys for quick access:

\\{emmet-mode-keymap}

Home page URL `http://www.emacswiki.org/emacs/Emmet'.

See also `emmet-expand-line'.

\(fn &optional ARG)" t nil)

(autoload 'emmet-expand-yas "emmet-mode" nil t nil)

(autoload 'emmet-preview "emmet-mode" "\
Expand emmet between BEG and END interactively.
This will show a preview of the expanded emmet code and you can
accept it or skip it.

\(fn BEG END)" t nil)

(autoload 'emmet-wrap-with-markup "emmet-mode" "\
Wrap region with markup.

\(fn WRAP-WITH)" t nil)

(autoload 'emmet-next-edit-point "emmet-mode" "\


\(fn COUNT)" t nil)

(autoload 'emmet-prev-edit-point "emmet-mode" "\


\(fn COUNT)" t nil)

(register-definition-prefixes "emmet-mode" '("emmet-"))

;;;***

;;;### (autoloads nil "markdown-mode" "markdown-mode.el" (0 0 0 0))
;;; Generated autoloads from markdown-mode.el

(autoload 'markdown-mode "markdown-mode" "\
Major mode for editing Markdown files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.\\(?:md\\|markdown\\|mkd\\|mdown\\|mkdn\\|mdwn\\)\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode" "\
Major mode for editing GitHub Flavored Markdown files.

\(fn)" t nil)

(autoload 'markdown-view-mode "markdown-mode" "\
Major mode for viewing Markdown content.

\(fn)" t nil)

(autoload 'gfm-view-mode "markdown-mode" "\
Major mode for viewing GitHub Flavored Markdown content.

\(fn)" t nil)

(autoload 'markdown-live-preview-mode "markdown-mode" "\
Toggle native previewing on save for a specific markdown file.

This is a minor mode.  If called interactively, toggle the
`Markdown-Live-Preview mode' mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `markdown-live-preview-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "markdown-mode" '("defun-markdown-" "gfm-" "markdown"))

;;;***

;;;### (autoloads nil "pyvenv" "pyvenv.el" (0 0 0 0))
;;; Generated autoloads from pyvenv.el

(autoload 'pyvenv-activate "pyvenv" "\
Activate the virtual environment in DIRECTORY.

\(fn DIRECTORY)" t nil)

(autoload 'pyvenv-deactivate "pyvenv" "\
Deactivate any current virtual environment." t nil)

(autoload 'pyvenv-workon "pyvenv" "\
Activate a virtual environment from $WORKON_HOME.

If the virtual environment NAME is already active, this function
does not try to reactivate the environment.

\(fn NAME)" t nil)

(defvar pyvenv-mode nil "\
Non-nil if Pyvenv mode is enabled.
See the `pyvenv-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `pyvenv-mode'.")

(custom-autoload 'pyvenv-mode "pyvenv" nil)

(autoload 'pyvenv-mode "pyvenv" "\
Global minor mode for pyvenv.

This is a minor mode.  If called interactively, toggle the
`Pyvenv mode' mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='pyvenv-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

Will show the current virtualenv in the mode line, and respect a
`pyvenv-workon' setting in files.

\(fn &optional ARG)" t nil)

(defvar pyvenv-tracking-mode nil "\
Non-nil if Pyvenv-Tracking mode is enabled.
See the `pyvenv-tracking-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `pyvenv-tracking-mode'.")

(custom-autoload 'pyvenv-tracking-mode "pyvenv" nil)

(autoload 'pyvenv-tracking-mode "pyvenv" "\
Global minor mode to track the current virtualenv.

This is a minor mode.  If called interactively, toggle the
`Pyvenv-Tracking mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='pyvenv-tracking-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

When this mode is active, pyvenv will activate a buffer-specific
virtualenv whenever the user switches to a buffer with a
buffer-local `pyvenv-workon' or `pyvenv-activate' variable.

\(fn &optional ARG)" t nil)

(autoload 'pyvenv-restart-python "pyvenv" "\
Restart Python inferior processes." t nil)

(register-definition-prefixes "pyvenv" '("pyvenv-"))

;;;***

;;;### (autoloads nil "wgrep" "wgrep.el" (0 0 0 0))
;;; Generated autoloads from wgrep.el

(autoload 'wgrep-setup "wgrep" "\
Setup wgrep preparation." nil nil)

(add-hook 'grep-setup-hook 'wgrep-setup)

(register-definition-prefixes "wgrep" '("wgrep-"))

;;;***

(provide '+autoload-tp)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; +autoload-tp.el ends here
