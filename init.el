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

;; Load all packages in ./packages.d
(let ((default-directory (format "%s%s" abg-emacs-config-dir "packages.d")))
  (normal-top-level-add-subdirs-to-load-path))
