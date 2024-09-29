;;; Compiled snippets and support files for `beancount-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'beancount-mode
                     '(("ts" "`(format-time-string \"%Y-%m\")`-$1 * \"$2\"\n  $0" "transaction" nil nil nil "/home/spike/.emacs.d/snippets/beancount-mode/ts" nil nil)
                       ("ls" "`(format-time-string \"%Y-%m\" (let* ((now (current-time))\n       (month (nth 4 (decode-time now)))\n       (year (nth 5 (decode-time now))))\n  (if (> month 1)\n      (encode-time 0 0 0 1 (1- month) year)\n    (encode-time 0 0 0 1 12 (1- year)))))`-$1 * \"$2\"\n  $0" "transaction with last month" nil nil nil "/home/spike/.emacs.d/snippets/beancount-mode/ls" nil nil)
                       ("c" "$1 CNY\n   $0" "CNY" nil nil nil "/home/spike/.emacs.d/snippets/beancount-mode/CNY" nil nil)))


;;; Do not edit! File generated at Sun Sep 29 10:57:20 2024
