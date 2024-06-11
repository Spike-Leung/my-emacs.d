;;; init-local.el --- load local custom configs
;; https://github.com/purcell/emacs.d
;;; Commentary:
;;; Code:
(add-to-list 'load-path (expand-file-name "lisp/my-lisp" user-emacs-directory))

(require 'init-auto-save)
(require 'init-citre)
(require 'init-company)
(require 'init-denote)
(require 'init-easy-hugo)
(require 'init-gitmoji)
(require 'init-vue-mode)
(require 'init-my-markdown)
(require 'init-my-misc)
(require 'init-my-org)
(require 'init-modus-theme)
(require 'init-projectile)
(require 'init-typescript)
(require 'init-wsl)
(require 'init-yasnippet)
(require 'init-magit)
(require 'init-codeium)

(provide 'init-local)
;;; init-local.el ends here
