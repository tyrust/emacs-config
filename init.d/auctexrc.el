;see http://www.xemacs.org/Documentation/packages/html/auctex_6.html
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)
;(add-hook 'LaTeX-mode-hook 'electric-pair-mode)


(setq TeX-newline-function (quote reindent-then-newline-and-indent))
(setq preview-gs-options (quote ("-q" "-dNOSAFER" "-dNOPAUSE" "-DNOPLATFONTS" "-dPrinted" "-dTextAlphaBits=4" "-dGraphicsAlphaBits=4")))
