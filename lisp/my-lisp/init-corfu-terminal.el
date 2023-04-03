(when (maybe-require-package 'corfu-terminal)
  (add-hook 'after-init-hook 'corfu-terminal-mode))
(provide 'init-corfu-terminal)
