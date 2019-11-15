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

;; use utf-8 whenefer possible
(prefer-coding-system 'utf-8)

;; benchmark emacs startup:
(require 'benchmark-init)
;; remove benchmarking after initializing emacs
(add-hook 'after-init-hook 'benchmark-init/deactivate)

;; Don't displaly splash screen and startup message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Don't show the menu bar
;; (menu-bar-mode -1)

;; Don't show the tool bar
;;(tool-bar-mode -1)

;; No backup files... (Backup's for pussies)
(setq make-backup-files nil)
;; and for autosave files, save them here:
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

;;; ######  STYLE  #######
;; My custom themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; load this theme for now:
(load-theme 'zenburn t)

;; Always show line numbers:
(global-linum-mode t)

;;; ####### NAVIGATION  #######
;; Jump around!
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;;; ######## CODING  ########
;; TS/JS
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (setq-default typescript-indent-level 2)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

(setq tide-tsserver-executable "~/npm/node_modules/typescript/bin/tsserver")

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; indentation:
(setq default-tab-width 2)
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
 (add-to-list 'auto-mode-alist '("\\.geom\\'" . glsl-mode))

;; org-mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files (list "C:/Users/tgdthst6/Dropbox/org/private.org"
                             "C:/Users/tgdthst6/Dropbox/org/work.org"
                             "C:/Users/tgdthst6/Dropbox/org/school.org"))

;;; save my org buffers periodically
(add-hook 'org-agenda-mode-hook
          (lambda ()
            (add-hook 'auto-save-hook 'org-save-all-org-buffers nil t)
            (auto-save-mode)))

;; When org-mode starts it (org-mode-map) overrides the ace-jump-mode.
(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "\C-c SPC") 'ace-jump-mode)))

;(setq org-agenda-custom-commands
;      '(("c" . "My Custom Agendas")
;        ("cu" "Unscheduled TODO"
;         ((todo ""
;                ((org-agenda-overriding-header "\nUnscheduled TODO")
;                 (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled)))))
;         nil
;         nil)))

(setq org-agenda-custom-commands
      '(("h" "Agenda and unscheduled todos"
         ((agenda "")
          (tags-todo "private" ((org-agenda-overriding-header "Unscheduled Private")
                                (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled))))
          (tags-todo "work" ((org-agenda-overriding-header "Unscheduled Work")
                                (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled))))          
          (tags-todo "school" ((org-agenda-overriding-header "Unscheduled School")
                                (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled))))
          ))))

; clock in and out
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(setq org-log-done t)

(setq org-use-sub-superscripts nil)

;; i want a scratch buffer on the left and my todo list on the right:
;; pretty sure this can be done nicer
;;(split-window-right)
;;(other-window 1)
;;(find-file "C:/Users/tgdthst6/orgmode/all.org")
;;(other-window 1)
;;(custom-set-variables
;; ;; custom-set-variables was added by Custom.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil-tutor evil company tide tern ng2-mode ox-jira helm magit zenburn-theme zenburn groovy-mode flx-ido color-theme-sanityinc-solarized benchmark-init ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; MAGIT Magic:
(global-set-key (kbd "C-x g") 'magit-status)


;; Helm:
(require 'helm-config)
(helm-mode 1)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)

(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(add-hook 'eshell-mode-hook
          (lambda ()
            (eshell-cmpl-initialize)
            (define-key eshell-mode-map [remap eshell-pcomplete] 'helm-esh-pcomplete)
            (define-key eshell-mode-map (kbd "M-p") 'helm-eshell-history)))

(require 'ox-jira)

;; (require 'evil)
;; (evil-mode 1)


(add-to-list 'auto-mode-alist '("\\.pch$" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.pcb$" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.sql$" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.vw$" . sql-mode))

(add-hook 'eshell-mode-hook
          (lambda ()
            (eshell-cmpl-initialize)
            (define-key eshell-mode-map [remap eshell-pcomplete] 'helm-esh-pcomplete)
            (define-key eshell-mode-map (kbd "M-p") 'helm-eshell-history)))


(defun pcomplete/sudo ()
  (let ((prec (pcomplete-arg 'last -1)))
    (cond ((string= "sudo" prec)
           (while (pcomplete-here*
                   (funcall pcomplete-command-completion-function)
                   (pcomplete-arg 'last) t))))))

(add-hook 'eshell-mode-hook
          (lambda ()
            (define-key eshell-mode-map
              (kbd "M-p")
              'helm-eshell-history)))

