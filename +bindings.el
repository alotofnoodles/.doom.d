;;; ~/.doom.d]/+bindings.el -*- lexical-binding: t; -*-

(map!
 :gnvime "s-s"   #'save-buffer
 :gnvime "s-z"   #'undo-tree-undo
 :gnvime "s-Z"   #'undo-tree-redo
 :gnvime "C-]"   #'dumb-jump-go
 :gnvime "C-["   #'dumb-jump-back

 :v      "s"     #'evil-surround-region
 :v      "R"   #'evil-visual-replace-replace-regexp
 :gnvime "s-F" #'counsel-projectile-rg

 :en     "s-l"   #'recenter
 :en     "C-h"   #'evil-window-left
 :en     "C-j"   #'evil-window-down
 :en     "C-k"   #'evil-window-up
 :en     "C-l"   #'evil-window-right)

(evil-define-key 'visual evil-snipe-local-mode-map "z" 'evil-snipe-s)
(evil-define-key 'visual evil-snipe-local-mode-map "Z" 'evil-snipe-S)
