;;; Package --- Summary
;; init-emoji

;;; Commentary:
;;; Code:
(when (maybe-require-package 'emojify)
  (with-eval-after-load 'emojify
    (add-hook 'after-init-hook #'global-emojify-mode)))

(provide 'init-emoji)
;;; init-emoji.el ends here
