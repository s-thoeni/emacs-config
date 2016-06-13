;;; -- Thoenis EMACS config --
;;; -- @since: 2016.05.02   --

;;; ######  GENERAL  #######
;; Because we want more packages:
(require 'package)
(require 'cl)
(add-to-list 'package-archives
              '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
(setq package-enable-at-startup nil)
(add-to-list 'load-path "~/.emacs.d/elpa")

;; Don't displaly splash screen and startup message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Don't show the menu bar
(menu-bar-mode -1)

;; Don't show the tool bar
(tool-bar-mode -1)

;; No backup files... (Backup's for pussies)
(setq make-backup-files nil)

;;; ######  STYLE  #######
;; My custom themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; load this theme for now:
(load-theme 'zenburn t)

;; Always show line numbers:
(global-linum-mode t)

;;; ####### NAVIGATION  #######
;; Jump around!
(progn
  (require 'ace-jump-mode)                                                                                                                                                            
    (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)                                                                                                                            
    (define-key global-map (kbd "C-c C-c SPC") 'ace-jump-char-mode)                                                                                                                   
    (define-key global-map (kbd "C-c C-c C-c SPC") 'ace-jump-line-mode)                                                                                                               
) 

;; ace-window:
(global-set-key (kbd "M-p") 'ace-window)

(global-set-key (kbd "<C-tab>") 'tabbar-forward)
(global-set-key (kbd "C-S-<iso-lefttab>") 'tabbar-backward)

;; ido mode:
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

;;; ######## CODING  ########
;; ECMA Script editing:
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(custom-set-variables
 '(js2-basic-offset 4))
(custom-set-faces
 )
(setq js2-mode-hook
  '(lambda () (progn
    (set-variable 'indent-tabs-mode nil))))

(setq httpd-port 8081)
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

(add-hook 'js2-mode-hook 'ac-js2-mode)
;; indentation:
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)

(put 'upcase-region 'disabled nil)
