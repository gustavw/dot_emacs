(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)
;(semantic-load-enable-code-helpers)

(semantic-mode 1)

(defun alexott/cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))
;(defun my:add-semantic-to-company()
;  (add-to-list 'company-backends

(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'c-mode-hook 'alexott/cedet-hook)
(add-hook 'c++-mode-hook 'alexott/cedet-hook)

;; Enable EDE only in C/C++
(require 'ede)
(global-ede-mode)

;; Append include paths
(semantic-add-system-include "/usr/local/opt/avr-gcc/avr/include")

(provide 'setup-cedet)
