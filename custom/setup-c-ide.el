(use-package company
  :ensure t
  :init (global-company-mode)
  :config (progn
            (setq company-idle-delay 0.2
                  company-minimum-prefix-length 1)
            (add-hook 'after-init-hook 'global-company-mode)))

;; Completions + lots of IDE features with RTags
(use-package rtags
  :ensure t
  :config (progn
            (setq rtags-use-ivy t
                  rtags-completions-enabled t)
            (push 'company-rtags company-backends)))

;; Automatic management of compile_commands.json
(use-package cmake-ide
  :ensure t
  :config (progn
            (cmake-ide-setup)
            ;(setq cmake-ide-flags-c "-I/usr/local/Cellar/avr-gcc/6.3.0/avr/include/")
            (setq cmake-ide-build-pool-use-persistent-naming t)))

;; Error checking with flycheck-rtags as a backend
(use-package flycheck
  :ensure t
  :config (progn
            (add-hook 'c++-mode-hook 'flycheck-mode)
            (add-hook 'c-mode-hook 'flycheck-mode)))

(use-package flycheck-rtags :ensure t)

(defun my-flycheck-rtags-setup ()
  (flycheck-select-checker 'rtags)
  (setq-local flycheck-highlighting-mode nil)
  (setq-local flycheck-check-syntax-automatically nil))
(add-hook 'c-mode-hook #'my-flycheck-rtags-setup)
(add-hook 'c++-mode-hook #'my-flycheck-rtags-setup)

;; Format files consistently
(use-package clang-format
  :ensure t)

;; How much I like my files indented
(setq c-basic-offset 2)
(provide 'setup-c-ide)
