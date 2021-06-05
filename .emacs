;;; .emacs --- Emacs initialization file -*- lexical-binding: t; -*-

;;; Commentary
;; Welcome to Emacs (http://go/emacs).
;;
;; If you see this file, your homedir was just created on this workstation.
;; That means either you are new to Google (in that case, welcome!) or you
;; got yourself a faster machine.
;;
;; Either way, the main goal of this configuration is to help you be more
;; productive; if you have ideas, praise or complaints, direct them to
;; emacs-users@google.com (http://g/emacs-users).  We'd especially like to hear
;; from you if you can think of ways to make this configuration better for the
;; next Noogler.
;;
;; If you want to learn more about Emacs at Google, see http://go/emacs.

;;; Code:

;; This package allows M-w to copy text to the clipboard of the host machine through
;; ssh through OSC 52 escape sequences.
(require 'clipetty)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://stable.melpa.org/packages/") t)

;; Initialize the package defined before through require
(package-initialize)

;; enable clipetty package to be able to copy to clipboard (not need in mac)
;;(use-package clipetty
;;  :ensure t
;;  :hook (after-init . global-clipetty-mode))

;; multiple-cursors config sectIon
(global-set-key (kbd "C-c C-c") 'mc/edit-lines)
(global-set-key (kbd "C-c <down>") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c <up>") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c <right>") 'mc/mark-all-like-this)

;; enable emacs edit modes
(ido-mode t)
(cua-mode t)

;; move buffer between different positions
(load "~/zzq_emacs/buffer-move.el")

;; zzq's test script
(load "~/zzq_emacs/zzq_test.el")

