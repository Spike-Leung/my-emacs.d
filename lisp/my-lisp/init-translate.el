;;; Package --- Summary
;; init-translate
;;; Commentary:
;;; See: https://github.com/manateelazycat/insert-translated-name
;;; Code:
(push (expand-file-name "lisp/my-lisp/insert-translated-name" user-emacs-directory) load-path)
(require 'insert-translated-name)
(setq insert-translated-name-crow-engine "lingva")

(defun spike-leung/translate-ruiyun-key ()
  "Translate key of ruiyun."
  (interactive)
  (progn
    (yas-exit-all-snippets)
    (save-excursion
      (back-to-indentation)
      (push-mark)
      (search-forward ":")
      (backward-char 1)
      (insert-translated-name-replace-with-underline))
    ))

(defun spike-leung/copy-translate-key ()
  "Copy translate key in line."
  (interactive)
  (let (start end)
    (save-excursion
      (back-to-indentation)
      (setq start (point))
      (setq end (1- (search-forward ":")))
      (kill-ring-save start end)
      (message "Copied: %s" (buffer-substring start end)))))

(defun spike-leung/parse-chinese-in-line ()
  "Parse Chinese characters in current line and copy to kill-ring."
  (interactive)
  (let ((chinese-regexp "[\u4e00-\u9fa5]+") ; Unicode range for Chinese characters
        (line-text (buffer-substring (line-beginning-position) (line-end-position))))
    (if (string-match chinese-regexp line-text)
        (progn
          (let ((chinese-str (match-string 0 line-text)))
            (kill-new (format "%s: '%s'," chinese-str chinese-str))
            (message "Chinese characters copied to kill-ring.")))
      (message "No Chinese characters found in line."))))


(global-set-key (kbd "C-c C-l") 'spike-leung/translate-ruiyun-key)
(global-set-key (kbd "C-c C-k") 'spike-leung/copy-translate-key)
(global-set-key (kbd "C-c C-y") 'spike-leung/parse-chinese-in-line)
(provide 'init-translate)
;;; init-translate.el ends here
