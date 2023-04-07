;;; Package --- Summary
;; init-local
;; https://github.com/purcell/emacs.d


;;; Commentary:
;;; Code:
(add-to-list 'load-path (expand-file-name "lisp/my-lisp" user-emacs-directory))

(require 'init-my-theme)
(require 'init-face)
(require 'init-yasnippet)
(require 'init-my-org)
(require 'init-org-roam)
(require 'init-org-roam-ui)
(require 'init-org-download)
(require 'init-my-markdown)
(require 'init-easy-hugo)
(require 'init-extension-mode)
(require 'init-auto-save)
(require 'init-custom-function)
(require 'init-typescript)
(require 'init-js)
;; (require 'init-proxy)
(require 'init-company)
(require 'init-reset-keybinding)
(require 'init-vue)
(require 'init-wsl)
(require 'init-eglot)
(require 'init-elfeed)
(require 'init-projectile)
(require 'init-gitmoji)
;; (require 'init-deno-bridge)
;; (require 'init-translate)
(require 'init-corfu-terminal)
(provide 'init-local)
;;; init-local.el ends here
