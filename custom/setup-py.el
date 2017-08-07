;; Python setup
(setq python-shell-interpreter "ipython3")
(setq python-shell-interpreter-args "--simple-prompt -i")

(use-package jedi
  :ensure t
  :config(progn
           (add-hook 'python-mode-hook 'jedi:setup)
           (setq jedi:complete-on-dot t)
           (setq py-python-command "/usr/local/bin/python3")
           ))

(use-package elpy
  :ensure t
  :config
  (progn
    (setq elpy-rpc-python-command "/usr/local/bin/python3")
    (elpy-enable))
  )

(provide 'setup-py)
