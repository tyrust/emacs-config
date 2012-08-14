;; prefer text mode to fundamental mode
(setq-default major-mode 'text-mode)

;; general setup
(setq auto-fill-mode 1)
(next-screen-context-lines 10)
(tab-width 4)

;; display line and col number of insertion point
(setq line-number-mode t)
(setq column-number-mode t)

;; give C-x C-m and C-c C-m functionality of M-x
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; prefer backward-kill-word over backspace
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; get rid of menus and scroll bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; run current file, bind to <f8>
(defun run-current-file ()
  "Execute or compile the current file.
For example, if the current buffer is the file x.pl,
then it'll call “perl x.pl” in a shell.
The file can be PHP, Perl, Python, Ruby, javascript, Bash, ocaml, vb, elisp.
File suffix is used to determine what program to run."
(interactive)
  (let (suffixMap fName suffix progName cmdStr)

    ;; a keyed list of file suffix to comand-line program path/name
    (setq suffixMap 
          '(
            ("php" . "php")
            ("pl" . "perl")
            ("py" . "python")
            ("rb" . "ruby")
            ("js" . "js")
            ("sh" . "bash")
            ("ml" . "ocaml")
            ("vbs" . "cscript")
;            ("pov" . "/usr/local/bin/povray +R2 +A0.1 +J1.2 +Am2 +Q9 +H480 +W640")
            )
          )

    (setq fName (buffer-file-name))
    (setq suffix (file-name-extension fName))
    (setq progName (cdr (assoc suffix suffixMap)))
    (setq cmdStr (concat progName " \""   fName "\""))

    (if (string-equal suffix "el") ; special case for emacs lisp
        (load-file fName) 
      (if progName
        (progn
          (message "Running…")
          (shell-command cmdStr "*run-current-file output*" )
          )
        (message "No recognized program file suffix for this file.")
        )
)))
; bind it
(global-set-key (kbd "<f8>") 'run-current-file)

;; tab completion
(setq read-file-name-completion-ignore-case t)

;; for html, use a larger fill size
(add-hook 'html-mode-hook
	  (lambda () 
	    (auto-fill-mode 1)
	    (set-fill-column 89)))


;;; the following two redefines are from http://www-users.math.umd.edu/~halbert/getcontent.cgi?code+emacs
;; redefining the make-backup-file-name function in order to get
;; backup files in ~/.backups/ rather than scattered around all over
;; the filesystem. Note that you must have a directory ~/.backups/
;; made.  This function looks first to see if that folder exists.  If
;; it does not the standard backup copy is made.
(defun make-backup-file-name (file-name)
  "Create the non-numeric backup file name for `file-name'."
  (require 'dired)
  (if (file-exists-p "~/.backups")
      (concat (expand-file-name "~/.backups/")
              (dired-replace-in-string "/" "!" file-name))
    (concat file-name "~")))

;; redefining the make-auto-save-file-name function in order to get
;; autosave files sent to a single directory.  Note that this function
;; looks first to determine if you have a ~/.autosaves/ directory.  If
;; you do not it proceeds with the standard auto-save procedure.
(defun make-auto-save-file-name ()
  "Return file name to use for auto-saves of current buffer.."
  (if buffer-file-name
      (if (file-exists-p "~/.autosaves/") 
          (concat (expand-file-name "~/.autosaves/") "#"
                  (replace-regexp-in-string "/" "!" buffer-file-name)
                  "#") 
         (concat
          (file-name-directory buffer-file-name)
          "#"
          (file-name-nondirectory buffer-file-name)
          "#"))
    (expand-file-name
     (concat "#%" (buffer-name) "#"))))

;; have grep ignore .svn
(grep-compute-defaults)
(grep-apply-setting 'grep-command "grep --exclude=\\*.svn\\* -nH -e ")
(setq find-command "find . -type f")
(setq temp (concat find-command
				   " -exec "
				   grep-command
				   " {} /dev/null \\;"))
(grep-apply-setting 'grep-find-command (cons temp (+ 1 (length (concat find-command
																	   " -exec "
																	   grep-command)))))
(makunbound 'temp)

;; Fix what shell colors breaks
(add-hook 'shell-mode-hook
	  'ansi-color-for-comint-mode-on)

;; More descriptive buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)

;; Desktop setup
(require 'desktop)
(desktop-save-mode 1)
(defun my-desktop-save ()
  (interactive)
  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))
(add-hook 'auto-save-hook 'my-desktop-save)
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")
(setq desktop-base-file-name "emacs-desktop")

;; inhibit start up
(inhibit-startup-screen t)