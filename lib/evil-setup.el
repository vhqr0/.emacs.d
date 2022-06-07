(setq evil-want-C-i-jump nil
      evil-want-keybinding nil
      evil-want-fine-undo t
      evil-undo-system 'undo-redo
      evil-symbol-word-search t
      evil-search-module 'evil-search)

(require 'evil)
(require 'evil-surround)



;; surround

(define-key evil-operator-state-map "s"  'evil-surround-edit)
(define-key evil-operator-state-map "S"  'evil-Surround-edit)
(define-key evil-visual-state-map   "S"  'evil-surround-region)
(define-key evil-visual-state-map   "gS" 'evil-Surround-region)

;; scroll

(define-key evil-motion-state-map "\M-j" 'evil-scroll-down)
(define-key evil-motion-state-map "\M-k" 'evil-scroll-up)



;; jk mode

(defvar evil-jk-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "j" "n")
    (define-key map "k" "p")
    (define-key map "J" '(menu-item "" nil :filter
                                    (lambda (_)
                                      (let (evil-jk-mode-map)
                                        (lookup-key (current-local-map) "j")))))
    (define-key map "K" '(menu-item "" nil :filter
                                    (lambda (_)
                                      (let (evil-jk-mode-map)
                                        (lookup-key (current-local-map) "k")))))
    (define-key map "\M-j" 'evil-scroll-down)
    (define-key map "\M-k" 'evil-scroll-up)
    (define-key map ":"    'evil-ex)
    map))

(define-minor-mode evil-jk-mode
  "Evil JK mode."
  :keymap evil-jk-mode-map
  :lighter " <JK>")

;; setup

(defvar evil-setup-jk-modes
  '(special-mode compilation-mode dired-mode completion-list-mode image-mode doc-view-mode))

(defvar evil-setup-motion-modes
  '(hexl-mode diff-mode))

(defvar evil-setup-normal-modes
  '(prog-mode text-mode fundamental-mode conf-mode erc-mode))

(defvar evil-setup-insert-modes
  '(comint-mode eshell-mode))

(defun evil-setup ()
  (cond ((apply 'derived-mode-p evil-setup-jk-modes)
         (evil-emacs-state)
         (evil-jk-mode 1))
        ((apply 'derived-mode-p evil-setup-motion-modes)
         (evil-motion-state))
        ((apply 'derived-mode-p evil-setup-normal-modes)
         (evil-normal-state))
        ((apply 'derived-mode-p evil-setup-insert-modes)
         (evil-insert-state))
        (t
         (evil-emacs-state))))

(defun evil-setup-motion-or-normal-state ()
  (interactive)
  (cond ((or (apply 'derived-mode-p evil-setup-jk-modes)
             (apply 'derived-mode-p evil-setup-motion-modes))
         (evil-motion-state))
        (t
         (evil-normal-state))))

(add-hook 'after-change-major-mode-hook 'evil-setup)

(global-set-key "\M-z" [escape])
(global-set-key "\C-z" 'evil-setup-motion-or-normal-state)

(define-key evil-emacs-state-map "\C-z" nil)

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



;; leader

(defun god-C-c ()
  (interactive)
  (let ((bind (key-binding (kbd (format "C-c C-%c" (read-char "C-c C-"))))))
    (when (commandp bind)
      (setq this-command bind
            real-this-command bind)
      (call-interactively bind))))

(defvar evil-leader-map (make-sparse-keymap))

(define-key evil-jk-mode-map      "\s" evil-leader-map)
(define-key evil-motion-state-map "\s" evil-leader-map)

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

(define-key help-map "t" 'find-library)
(define-key help-map "T" 'load-library)

(define-key ctl-x-x-map "h" 'hl-line-mode)
(define-key ctl-x-x-map "s" 'whitespace-mode)
(define-key ctl-x-x-map "l" 'display-line-numbers-mode)

(define-key evil-leader-map "1" 'delete-other-windows)
(define-key evil-leader-map "2" 'split-window-below)
(define-key evil-leader-map "3" 'split-window-right)
(define-key evil-leader-map "q" 'quit-window)
(define-key evil-leader-map "0" 'delete-window)
(define-key evil-leader-map "o" 'other-window)
(define-key evil-leader-map "9" 'rotate-window) ; simple-x
(define-key evil-leader-map "U" 'winner-undo)   ; winner
(define-key evil-leader-map "R" 'winner-redo)   ; winner
(define-key evil-leader-map "H" 'previous-buffer)
(define-key evil-leader-map "L" 'next-buffer)
(define-key evil-leader-map "k" 'kill-buffer)

(define-key evil-leader-map "\s" 'execute-extended-command)
(define-key evil-leader-map "f" 'find-file)
(define-key evil-leader-map "b" 'switch-to-buffer)
(define-key evil-leader-map "u" 'universal-argument)
(define-key evil-leader-map "z" 'repeat)
(define-key evil-leader-map "y" 'yank-pop)
(define-key evil-leader-map "m" 'set-mark-command)
(define-key evil-leader-map ";" 'eval-expression)
(define-key evil-leader-map "i" 'imenu)
(define-key evil-leader-map "j" 'dired-jump)
(define-key evil-leader-map "e" 'eshell-dwim) ; simple-x
(define-key evil-leader-map "B" 'ibuffer)
(define-key evil-leader-map "%" 'query-replace-regexp)
(define-key evil-leader-map "," 'xref-pop-marker-stack)
(define-key evil-leader-map "." 'xref-find-definitions)
(define-key evil-leader-map "?" 'xref-find-references)

;;; expand-region
(define-key evil-leader-map "=" 'er/expand-region)

;;; magit
(define-key evil-leader-map "V" 'magit)

;;; counsel
(define-key evil-leader-map "F" 'counsel-git)

(provide 'evil-setup)
