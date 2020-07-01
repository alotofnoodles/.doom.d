;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; core
(setq confirm-kill-emacs nil) ;; Disable exit prompt
(setq tags-add-tables nil) ;; Disable prompt to keep current list of tags
(setq-default doom-scratch-buffer-major-mode 'org-mode); Use org mode on scratch buffer

;; ui
(setq doom-font (font-spec :family "Hack Nerd Font Mono" :size 16))
(setq doom-theme 'doom-tomorrow-night)

;; use full screen
(when IS-MAC
  (setq ns-use-thin-smoothing t)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark)))
  ;; (run-with-idle-timer 0.01 nil 'toggle-frame-fullscreen))

;; hooks
;; (add-hook 'after-init-hook 'inf-ruby-switch-setup)
;; (add-hook 'after-init-hook #'global-emojify-mode)

;; settings
(global-auto-revert-mode t) ;; Always reload buffer
(global-evil-matchit-mode 1) ;; Activate evil-matchit

(load! "+bindings") ;; Load custom bindings

(after! super-save
  (super-save-mode +1))

;; org
(setq org-agenda-files '("~/org"))

;; select inner word ala vim
(defadvice evil-inner-word (around underscore-as-word activate)
  (let ((table (copy-syntax-table (syntax-table))))
    (modify-syntax-entry ?_ "w" table)
    (with-syntax-table table
      ad-do-it)))

(use-package! forge
  :config
  (add-to-list 'forge-alist '("git.realestate.com.au" "git.realestate.com.au/api/v3"
                              "git.realestate.com.au" forge-github-repository)))

(use-package zetteldeft
  :ensure t
  :after deft
  :config
  (zetteldeft-set-classic-keybindings)
  (setq deft-default-extension "md")
  (setq deft-directory "/Users/will.djingga/Documents/Notes")
  (setq deft-extensions '("md" "org" "txt"))
  (setq zetteldeft-title-prefix "# ")
  (setq zetteldeft-link-indicator "[[" zetteldeft-link-suffix "]]")
  )
;; (setq zetteldeft-link-indicator "[["
;;       zetteldeft-link-suffix "]]")
;; (setq zetteldeft-title-prefix "# ")

;; Rspec
;; (setq rspec-use-docker-when-possible f)
;; (setq rspec-docker-container "test")

;; (server-start)
