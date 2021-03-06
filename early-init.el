;;; -*- lexical-binding: t -*-

(setq load-prefer-newer t
      byte-compile-docstring-max-column 65536)

(let ((alist file-name-handler-alist))
  (setq file-name-handler-alist nil)
  (add-hook 'after-init-hook
            (lambda () (setq file-name-handler-alist alist))))

(setq gc-cons-percentage 0.6
      gc-cons-threshold most-positive-fixnum)

(add-hook 'after-init-hook
          (lambda ()
            (setq gc-cons-percentage 0.1
                  gc-cons-threshold 2000000)))
