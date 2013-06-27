(add-to-list 'auto-mode-alist '(".*mutt.*" . message-mode))
(setq mail-header-separator "")
(add-hook 'message-mode-hook
          'turn-on-auto-fill)
(defvar message-mode-map
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "C-c C-c")  '(lambda ()
                                        "save and exit quickly"
                                        (interactive)
                                        (save-buffers-kill-emacs 1)))
      map)
    "Add Mutt C-c C-c command to message-mode keymap (creating it if needed)"
    )