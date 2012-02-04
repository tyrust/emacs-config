;; Directories and file names
(setq abg-emacs-init-file (or load-file-name buffer-file-name))
(setq abg-emacs-config-dir
      (file-name-directory abg-emacs-init-file))
(setq user-emacs-directory abg-emacs-config-dir)
(setq abg-elisp-dir (expand-file-name "elisp" abg-emacs-config-dir))
(setq abg-elisp-external-dir
      (expand-file-name "external" abg-elisp-dir))
(setq abg-init-dir
      (expand-file-name "init.d" abg-emacs-config-dir))

;; Load all elisp files in ./init.d
(if (file-exists-p abg-init-dir)
    (dolist (file (directory-files abg-init-dir t "\\.el$"))
      (load file)))(if (file-exists-p abg-init-dir)
    (dolist (file (directory-files abg-init-dir t "\\.el$"))
      (load file)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cperl-indent-parens-as-block t t)
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
