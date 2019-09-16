;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq doom-font (font-spec :family "SF Mono" :size 16))

;; ;;; I prefer cmd key for meta
;; (setq mac-option-key-is-meta nil
;;       mac-command-key-is-meta t
;;       mac-command-modifier 'meta
;;       mac-option-modifier 'super)

;; (add-hook 'after-init-hook 'inf-ruby-switch-setup)
;; (add-hook 'after-init-hook #'global-company-mode)
;; (add-hook 'after-init-hook #'global-emojify-mode)

(when IS-MAC
  (setq ns-use-thin-smoothing t)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  (run-with-idle-timer 0.01 nil 'toggle-frame-fullscreen))

;; Disable prompt to keep current list of tags
(setq tags-add-tables nil)

;; Always reload buffer
(global-auto-revert-mode t)

(load! "+bindings")

;; (after! super-
;;   (super-save-mode +1))

(after! ruby-mode
  (setq ruby-insert-encoding-magic-comment nil))

(defadvice evil-inner-word (around underscore-as-word activate)
  (let ((table (copy-syntax-table (syntax-table))))
    (modify-syntax-entry ?_ "w" table)
    (with-syntax-table table
      ad-do-it)))

;; (def-package! forge
;;   :config
;;   (add-to-list 'forge-alist '("git.realestate.com.au" "git.realestate.com.au/api"
;;                               "git.realestate.com.au" forge-github-repository)))

;; Use Docker to run rspec if possible
;; (setq rspec-use-docker-when-possible t)
;; (setq rspec-docker-container "dev")

(setq org-agenda-files '("~/org"))

(server-start)
