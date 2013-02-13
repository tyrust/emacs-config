;;; cperl-mode is preferred to perl-mode                                        
;;; "Brevity is the soul of wit" <foo at acm.org>  
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))
;; treat parens as block
(custom-set-variables
     '(cperl-indent-parens-as-block t))
;; keybindings
(defun custom-cperl-bindings ()
  ;; indent on RET
  (define-key cperl-mode-map [return] 'reindent-then-newline-and-indent)
  ;; comment region
  (define-key cperl-mode-map "\C-c\C-c" 'comment-region)
)
(add-hook 'cperl-mode-hook 'custom-cperl-bindings)

;; disable trailing whitespace indicator ('_' by default)
(setq cperl-invalid-face nil) 
;; expands for keywords such as foreach, while, etc...
(setq cperl-electric-keywords t) 
;; honestly forgot what this does
(setq cperl-indent-parens-as-block t t)
;; indent
(setq cperl-indent-level 4) 
;; colors
(custom-set-faces
 '(cperl-hash-face ((((class color) (background dark)) (:background "blue" :foreground "white" :slant italic :weight bold)))))