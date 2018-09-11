;;; -- Thoenis EMACS config --
;;; -- @since: 2016.05.02   --

;;; ######  GENERAL  #######
;; Because we want more packages:
(require 'package)
(require 'cl)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
              '("melpa-stable" . "https://stable.melpa.org/packages/") t)
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
  (define-key global-map (kbd "C-c C-c") 'ace-jump-mode)
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
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(custom-safe-themes
   (quote
    ("f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" default)))
 '(fci-rule-color "#383838")
 '(js2-basic-offset 4)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (markdown-mode latex-preview-pane matlab-mode zenburn-theme flx-ido ace-jump-mode)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
(put 'downcase-region 'disabled nil)

(setq matlab-shell-command "c:/dev/matlab/matlabshell.cmd")
(setq matlab-shell-command-switches '())
(setq matlab-shell-echoes nil)


;; spell checking
(add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
(setq ispell-program-name "aspell")


;; glsl-mode
(add-to-list 'load-path "~/.emacs.d/glsl/")
(autoload 'glsl-mode "glsl-mode" nil t)
 (add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))
 (add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
 (add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
 (add-to-list 'auto-mode-alist '("\\.geom\\'" . glsl-mode)
