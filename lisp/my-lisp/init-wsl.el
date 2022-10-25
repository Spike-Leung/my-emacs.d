;;; Package --- Summary
;; init-wsl
;;; Commentary:
;;; Code:
;;; https://adam.kruszewski.name/2017-09-16-emacs-in-wsl-and-opening-links.html

(let ((cmd-exe "/mnt/c/Windows/System32/cmd.exe")
      (cmd-args '("/c" "start")))
  (when (file-exists-p cmd-exe)
    (setq browse-url-generic-program  cmd-exe
          browse-url-generic-args     cmd-args
          browse-url-browser-function 'browse-url-generic)))

(provide 'init-wsl)
;;; init-wsl.el ends here
