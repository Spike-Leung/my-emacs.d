;;; Package --- Summary
;; init-local
;; https://github.com/purcell/emacs.d


;;; Commentary:
;;; Code:
(add-to-list 'load-path (expand-file-name "lisp/my-lisp" user-emacs-directory))

(require 'init-modus-theme)
(require 'init-mu4e)
(require 'init-my-org)
(require 'init-org-roam)
(require 'init-org-download)
(require 'init-my-markdown)
(require 'init-easy-hugo)
(require 'init-extension-mode)
(require 'init-elfeed)
(require 'init-beancount)

(provide 'init-local)
;;; init-local.el ends here
