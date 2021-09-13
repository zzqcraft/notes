(cua-mode t)
(ido-mode t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes '(misterioso))
 '(package-selected-packages '(multiple-cursors)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; multiple-cursor config
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-.") 'mc/mark-all-like-this)
(global-set-key (kbd "C-L") 'mc/edit-lines)
(global-set-key (kbd "<C-M-up>") 'move-text-up)
(global-set-key (kbd "<C-M-down>") 'move-text-down)

(load "~/git/notes/zzq_emacs/buffer_move.el")
(load "~/git/notes/zzq_emacs/zzq_test.el")
(load "~/git/notes/zzq_emacs/move_text.el")

;; do not generate backup file started with ~
(setq make-backup-files nil)
;; do not show welcome message and splash screen
(setq inhibit-startup-screen t)
