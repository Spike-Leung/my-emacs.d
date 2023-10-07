;;; init-my-misc.el --- miscellaneous config
;;; Commentary:
;;; Code:
(with-eval-after-load 'magit
  (setq magit-repository-directories
        '(("~/" . 1)
          ("~/git" . 1)
          )))

(provide 'init-my-misc)
;;; init-my-misc.el ends here
