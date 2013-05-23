(add-to-list 'load-path "/usr/share/emacs/site-lisp/emacs-goodies-el")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/emacs-color-theme-solarized")
;; (require 'color-theme)
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;      (color-theme-hober)))
(require 'color-theme-solarized)
(color-theme-solarized-dark)