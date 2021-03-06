(setq evil-want-C-i-jump nil
      evil-want-keybinding nil
      evil-want-fine-undo t
      evil-undo-system 'undo-redo
      evil-symbol-word-search t
      evil-search-module 'evil-search
      evil-respect-visual-line-mode t)

(require 'evil)
(require 'evil-surround)

(evil-mode 1)
(global-evil-surround-mode 1)

(global-set-key "\M-z" [escape])

(define-key evil-motion-state-map "\M-j" 'evil-scroll-down)
(define-key evil-motion-state-map "\M-k" 'evil-scroll-up)



;; initial state

(evil-define-state special
  "Special state."
  :tag " <SP> "
  :enable (emacs))

(define-key evil-special-state-map "\C-z" 'evil-motion-state)
(define-key evil-special-state-map "\M-j" 'evil-scroll-down)
(define-key evil-special-state-map "\M-k" 'evil-scroll-up)
(define-key evil-special-state-map ":"    'evil-ex)
(define-key evil-special-state-map "\\"   'evil-execute-in-emacs-state)
(define-key evil-special-state-map "j"    "\C-n")
(define-key evil-special-state-map "k"    "\C-p")
(define-key evil-special-state-map "h"    "\C-b")
(define-key evil-special-state-map "l"    "\C-f")

(defun evil-initial-state-for-buffer-override (&optional buffer default)
  (with-current-buffer (or buffer (current-buffer))
    (cond ((derived-mode-p 'dired-mode 'magit-mode 'image-mode 'doc-view-mode)
           'special)
          ((derived-mode-p 'comint-mode 'eshell-mode)
           'insert)
          (buffer-read-only
           'motion)
          (t
           'normal))))

(advice-add 'evil-initial-state-for-buffer
            :override 'evil-initial-state-for-buffer-override)

;; jk

(defun evil-jk-j ()
  (call-interactively
   (lookup-key `(,(current-local-map) ,(current-global-map)) [?k])))

(defun evil-jk ()
  (interactive)
  (if (and (not executing-kbd-macro)
           (not defining-kbd-macro)
           (not (sit-for 0.1 'no-redisplay)))
      (let ((next-char (read-event)))
        (if (eq next-char ?k)
            (push 'escape unread-command-events)
          (evil-jk-j)
          (push next-char unread-command-events)))
    (evil-jk-j)))

(define-key evil-insert-state-map  "j" 'evil-jk)
(define-key evil-replace-state-map "j" 'evil-jk)



;; operator

(defvar evil-operator-eval-alist
  '((emacs-lisp-mode . eval-region)
    (lisp-interaction-mode . eval-region)
    (python-mode . python-shell-send-region)))

(evil-define-operator evil-operator-eval (beg end)
  :move-point nil
  (interactive "<r>")
  (let ((func (cdr (assq major-mode evil-operator-eval-alist))))
    (if func
        (funcall func beg end)
      (user-error "Major mode doesn't support"))))

(evil-define-operator evil-operator-comment (beg end)
  :move-point nil
  (interactive "<r>")
  (comment-or-uncomment-region beg end))

(evil-define-operator evil-operator-narrow (beg end)
  :move-point nil
  (interactive "<r>")
  (narrow-to-region beg end))

(define-key evil-motion-state-map "gy" 'evil-operator-eval)
(define-key evil-normal-state-map "gc" 'evil-operator-comment)
(define-key evil-motion-state-map "g-" 'evil-operator-narrow)

;; textobject

(evil-define-text-object evil-tobj-defun (const &optional beg end type)
  (cl-destructuring-bind (beg . end)
      (bounds-of-thing-at-point 'defun)
    (evil-range beg end 'line)))

(evil-define-text-object evil-tobj-entire (const &optional beg end type)
  (evil-range (point-min) (point-max) 'line))

(define-key evil-inner-text-objects-map "f" 'evil-tobj-defun)
(define-key evil-outer-text-objects-map "f" 'evil-tobj-defun)
(define-key evil-inner-text-objects-map "h" 'evil-tobj-entire)
(define-key evil-outer-text-objects-map "h" 'evil-tobj-entire)

;; avy

(define-key evil-motion-state-map "gj" 'avy-goto-line)
(define-key evil-motion-state-map "gk" 'avy-goto-char-timer)
(define-key evil-motion-state-map "go" 'avy-goto-symbol-1)



;; leader

(defvar evil-leader-map (make-sparse-keymap))

(define-key evil-motion-state-map  "\s" evil-leader-map)
(define-key evil-special-state-map "\s" evil-leader-map)

(defun god-C-c ()
  (interactive)
  (let ((bind (key-binding (kbd (format "C-c C-%c" (read-char "C-c C-"))))))
    (when (commandp bind)
      (setq this-command bind
            real-this-command bind)
      (call-interactively bind))))

(define-key evil-leader-map "c" 'god-C-c)

(define-key evil-leader-map "h" help-map)
(define-key evil-leader-map "s" search-map)
(define-key evil-leader-map "g" goto-map)
(define-key evil-leader-map "r" ctl-x-r-map)
(define-key evil-leader-map "x" ctl-x-x-map)
(define-key evil-leader-map "n" narrow-map)
(define-key evil-leader-map "v" vc-prefix-map)
(define-key evil-leader-map "p" project-prefix-map)
(define-key evil-leader-map "4" ctl-x-4-map)
(define-key evil-leader-map "5" ctl-x-5-map)
(define-key evil-leader-map "t" tab-prefix-map)
(define-key evil-leader-map "w" evil-window-map)
(define-key evil-leader-map "\r" mule-keymap)

(define-key help-map "t" 'find-library)
(define-key help-map "T" 'load-library)

(define-key ctl-x-x-map "h" 'hl-line-mode)
(define-key ctl-x-x-map "s" 'whitespace-mode)
(define-key ctl-x-x-map "v" 'visual-line-mode)
(define-key ctl-x-x-map "l" 'display-line-numbers-mode)
(define-key ctl-x-x-map "a" 'auto-save-visited-mode)
(define-key ctl-x-x-map "/" 'evil-ex-nohighlight)

(define-key evil-leader-map "1" 'delete-other-windows)
(define-key evil-leader-map "2" 'split-window-below)
(define-key evil-leader-map "3" 'split-window-right)
(define-key evil-leader-map "q" 'quit-window)
(define-key evil-leader-map "o" 'other-window)
(define-key evil-leader-map "0" 'delete-window)
(define-key evil-leader-map "9" 'rotate-window) ; simple-x
(define-key evil-leader-map "u" 'winner-undo)   ; winner
(define-key evil-leader-map "U" 'winner-redo)   ; winner
(define-key evil-leader-map "k" 'kill-buffer)
(define-key evil-leader-map [left] 'previous-buffer)
(define-key evil-leader-map [right] 'next-buffer)
(define-key evil-leader-map "\t" 'evil-jump-backward)
(define-key evil-leader-map [backtab] 'evil-jump-forward)

(define-key evil-leader-map "\s" 'execute-extended-command)
(define-key evil-leader-map "f" 'find-file)
(define-key evil-leader-map "b" 'switch-to-buffer)
(define-key evil-leader-map "z" 'repeat)
(define-key evil-leader-map "m" 'set-mark-command)
(define-key evil-leader-map ";" 'eval-expression)
(define-key evil-leader-map "i" 'imenu)
(define-key evil-leader-map "j" 'dired-jump)
(define-key evil-leader-map "e" 'eshell-dwim) ; simple-x
(define-key evil-leader-map "B" 'ibuffer)
(define-key evil-leader-map "!" 'shell-command)
(define-key evil-leader-map "&" 'async-shell-command)
(define-key evil-leader-map "%" 'query-replace-regexp)
(define-key evil-leader-map "," 'xref-pop-marker-stack)
(define-key evil-leader-map "." 'xref-find-definitions)
(define-key evil-leader-map "?" 'xref-find-references)
(define-key evil-leader-map "d" 'eldoc-doc-buffer)

;;; expand-region
(define-key evil-leader-map "=" 'er/expand-region)

;;; magit
(define-key evil-leader-map "V" 'magit)

;;; yasnippet
(defvar yas-prefix-map
  (let ((map (make-sparse-keymap)))
    (define-key map "s" 'yas-insert-snippet)
    (define-key map "v" 'yas-visit-snippet-file)
    (define-key map "n" 'yas-new-snippet)
    (define-key map "a" 'aya-create)
    map))

(define-key evil-leader-map "a" yas-prefix-map)

;;; counsel
(define-key evil-leader-map "y" 'counsel-yank-pop)
(define-key evil-leader-map "F" 'counsel-git)

(provide 'evil-setup)
