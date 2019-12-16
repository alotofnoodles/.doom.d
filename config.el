;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; core
(setq confirm-kill-emacs nil) ;; Disable exit prompt
(setq tags-add-tables nil) ;; Disable prompt to keep current list of tags
(setq-default doom-scratch-buffer-major-mode 'org-mode); Use org mode on scratch buffer

;; ui
(setq doom-font (font-spec :family "SF Mono" :size 16))
(setq doom-theme 'doom-gruvbox)

;; use full screen
(when IS-MAC
  (setq ns-use-thin-smoothing t)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  (run-with-idle-timer 0.01 nil 'toggle-frame-fullscreen))

;; hooks
(add-hook 'after-init-hook 'inf-ruby-switch-setup)
(add-hook 'after-init-hook #'global-emojify-mode)

;; settings
(global-auto-revert-mode t) ;; Always reload buffer
(global-evil-matchit-mode 1) ;; Activate evil-matchit

(load! "+bindings") ;; Load custom bindings

(after! super-save
  (super-save-mode +1))

(after! enh-ruby-mode
  (setq enh-ruby-add-encoding-comment-on-save nil))

;; org
(setq org-agenda-files '("~/org"))

;; select inner word ala vim
(defadvice evil-inner-word (around underscore-as-word activate)
  (let ((table (copy-syntax-table (syntax-table))))
    (modify-syntax-entry ?_ "w" table)
    (with-syntax-table table
      ad-do-it)))

;; (def-package! forge
;;   :config
;;   (add-to-list 'forge-alist '("git.realestate.com.au" "git.realestate.com.au/api"
;;                               "git.realestate.com.au" forge-github-repository)))

;; Rspec
(setq rspec-use-docker-when-possible t)
(setq rspec-docker-container "dev")

;; Minitest
(use-package! minitest
  :defer t
  :config
  (when (featurep! :editor evil)
    (add-hook 'minitest-mode-hook #'evil-normalize-keymaps))
  (map! :localleader
        :map minitest-mode-map
        :prefix "t"
        "r" #'minitest-rerun
        "b" #'minitest-verify-all
        "m" #'minitest-verify-single
        "x" #'minitest-verify))

(server-start)
