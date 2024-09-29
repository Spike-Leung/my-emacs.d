;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
                     '(("weekly" "#+title: Weekly#$1\n#+INDEX: weekly!#$1\n#+date: `(format-time-string \"<%Y-%m-%d %a>\" (current-time))`\n#+lastmod: `(format-time-string \"<%Y-%m-%d %a %H:%M>\" (current-time))`\n#+author: Spike Leung\n#+email: l-yanlei@hotmail.com\n#+description: \"\"\n#+tags: weekly\n\n\n* News | Article\n$0\n* Tutorial\n\n* Code\n\n* Cool Bit\n\n* Tool | Library\n\n* Music\n" "weekly" nil
                        ("blog")
                        nil "/home/spike/.emacs.d/snippets/org-mode/weekly" nil nil)
                       ("fontc" "#+ATTR_LATEX: :options fontsize=\\scriptsize\n#+begin_src ${1:bash}\n  $0\n#+end_src\n" "fontc" nil nil nil "/home/spike/.emacs.d/snippets/org-mode/fontc" nil nil)
                       ("code" "#+BEGIN_SRC ${1:bash}\n  $0\n#+END_SRC\n" "#+begin_src ... #+end_src" nil nil nil "/home/spike/.emacs.d/snippets/org-mode/code" nil nil)
                       ("blog" "#+title: $1\n#+INDEX: $1\n#+date: `(format-time-string \"<%Y-%m-%d %a>\" (current-time))`\n#+lastmod: `(format-time-string \"<%Y-%m-%d %a %H:%M>\" (current-time))`\n#+author: Spike Leung\n#+email: l-yanlei@hotmail.com\n#+description: \"\"\n#+tags: blog\n\n$0\n\n* Refs\n" "blog" nil
                        ("blog")
                        nil "/home/spike/.emacs.d/snippets/org-mode/blog" nil nil)))


;;; Do not edit! File generated at Sun Sep 29 10:57:20 2024
