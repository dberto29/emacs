;; Basic configuration of emacs

;; Theme & font
(load-theme 'wombat t)
(set-face-attribute 'default nil :font "Roboto Mono" :height 100)

;; Initial buffer
(setq inhibit-startup-message t)                              ; no welcome buffer
(setq initial-buffer-choice "/home/dberto/.emacs.d/shortcuts_map" )

;; Initial frame size
(add-to-list 'default-frame-alist '(width  . 185))
(add-to-list 'default-frame-alist '(height . 45))

;; General variables

(setq history-length 20                                       ; max history saves
      use-dialog-box nil                                      ; no ugly dialogs
      global-auto-revert-non-file-buffers t                   ; update buffers thar are non-files too
      tab-always-indent 'complete                             ; use TAB to complete symbols
      mouse-wheel-scroll-amount '(2 ((shift) . 1))            ; scroll 2 lines
      mouse-wheel-progressive-speed nil                       ; don't accelerate
      mouse-wheel-follow-mouse 't                             ; scroll window under mouse cursor
      scroll-step 1)                                          ; scroll 1 line with keyboard

;; General Default modes

(menu-bar-mode -1)                                            ; no menu bar
(tool-bar-mode -1)                                            ; no tools bar
(scroll-bar-mode -1)                                          ; no scroll bars
(column-number-mode 1)                                        ; absolute numbering
(set-fringe-mode 10)                                          ; frame edges set to 10px
(recentf-mode 1)                                              ; remember recent files
(save-place-mode 1)                                           ; remember cursor position
(savehist-mode 1)                                             ; enable history saving
(delete-selection-mode t)                                     ; overwrite selected text when typing
(global-hl-line-mode 0)                                       ; enable current line highlight
(global-visual-line-mode t)                                   ; visual line breaking
(global-auto-revert-mode 1)                                   ; update externaly edited files
(global-display-line-numbers-mode 1)                          ; always show line numbers

;; Backups
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))

;; Package system initialization
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
               ("org"   . "https://orgmode.org/elpa/")
               ("elpa"  . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
    (package-refresh-contents))

;; package manager
(unless (package-installed-p 'use-package)
    (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)
