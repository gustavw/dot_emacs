(use-package rtags
  :ensure t
  :after company
  :init
  (add-hook 'c-mode-hook 'rtags-start-process-unless-running)
  (add-hook 'c++-mode-hook 'rtags-start-process-unless-running)
  (add-hook 'objc-mode-hook 'rtags-start-process-unless-running)
  (add-hook 'c-mode-common-hook #'setup-flycheck-rtags)
  (rtags-enable-standard-keybindings)
  :config
  (use-package helm-rtags :ensure t)
  (use-package company-rtags :ensure t)
  (use-package flycheck-rtags :ensure t)

  (defun setup-flycheck-rtags ()
    (interactive)
    (flycheck-select-checker 'rtags)
    ;; RTags creates more accurate overlays.
    (setq-local flycheck-highlighting-mode nil)
    (setq-local flycheck-check-syntax-automatically nil))

  (define-key c-mode-base-map (kbd "M-.")
    (function rtags-find-symbol-at-point))
  (define-key c-mode-base-map (kbd "M-,")
    (function rtags-find-references-at-point))
  ;; disable prelude's use of C-c r, as this is the rtags keyboard prefix
  ;(define-key prelude-mode-map (kbd "C-c r") nil)

  (rtags-diagnostics)
  (setq rtags-completions-enabled t)
  (push 'company-rtags company-backends)
  (global-company-mode)
  (define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))

  (setq rtags-rdm-includes "/usr/local/Cellar/avr-gcc/6.3.0/avr/include/")
  (setq rtags-autostart-diagnostics t)
  (setq rtags-use-helm t))

(provide 'setup-rtags)
