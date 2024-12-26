;;; init-my-org.el --- org config to overwrite init-org.el
;;; Commentary:
;; links: https://koenig-haunstetten.de/2016/07/09/code-snippet-for-orgmode-e05s02/
;;; Code:
(defun my/org-add-ids-to-headlines-in-file ()
  "Add ID properties to all headlines in the current file which do not already have one."
  (interactive)
  (org-map-entries 'org-id-get-create))

;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (add-hook 'before-save-hook 'my/org-add-ids-to-headlines-in-file nil 'local)))

(defun my/copy-id-to-clipboard()
  "Copy the ID property value to killring,
if no ID is there then create a new unique ID.
This function works only in org-mode buffers.

The purpose of this function is to easily construct id:-links to
Org-mode items. If its assigned to a key it saves you marking the
text and copying to the killring."
  (interactive)
  (when (eq major-mode 'org-mode) ; do this only in org-mode buffers
    (setq mytmpid (funcall 'org-id-get-create))
    (kill-new mytmpid)
    (message "Copied %s to killring (clipboard)" mytmpid)
    ))

;;; https://www.youtube.com/watch?v=be8TC-i-NpE&list=PLVtKhBrRV_ZkPnBtt_TD1Cs9PJlU0IIdE&index=40&t=111s
;;; https://koenig-haunstetten.de/2019/01/06/changes-to-my-orgmode-system/
;;; https://koenig-haunstetten.de/2018/02/17/improving-my-orgmode-workflow/
(defun my/copy-idlink-to-clipboard() "Copy an ID link with the
headline to killring, if no ID is there then create a new unique
ID.  This function works only in org-mode or org-agenda buffers.

The purpose of this function is to easily construct id:-links to
org-mode items. If its assigned to a key it saves you marking the
text and copying to the killring."
       (interactive)
       (when (eq major-mode 'org-agenda-mode) ;switch to orgmode
         (org-agenda-show)
         (org-agenda-goto))
       (when (eq major-mode 'org-mode) ; do this only in org-mode buffers
         (setq mytmphead (nth 4 (org-heading-components)))
         (setq mytmpid (funcall 'org-id-get-create))
         (setq mytmplink (format "[[id:%s][%s]]" mytmpid mytmphead))
         (kill-new mytmplink)
         (message "Copied %s to killring (clipboard)" mytmplink)
         ))

(global-set-key (kbd "<f5>") 'my/copy-idlink-to-clipboard)


;;; Agenda views
(let ((active-project-match "-INBOX/PROJECT"))

  (setq org-stuck-projects
        `(,active-project-match ("NEXT" "TODO")))

  (setq org-agenda-compact-blocks t
        org-agenda-sticky t
        org-agenda-start-on-weekday nil
        org-agenda-span 'day
        org-agenda-include-diary nil
        org-agenda-sorting-strategy
        '((agenda habit-down time-up user-defined-up effort-up category-keep)
          (todo category-up effort-up)
          (tags category-up effort-up)
          (search category-up))
        org-agenda-window-setup 'current-window
        org-agenda-custom-commands
        `(("g" "GTD"
           ((agenda "" nil)
            (tags "INBOX"
                  ((org-agenda-overriding-header "Inbox")
                   (org-tags-match-list-sublevels nil)))
            (stuck ""
                   ((org-agenda-overriding-header "Stuck Projects")
                    (org-agenda-tags-todo-honor-ignore-options t)
                    (org-tags-match-list-sublevels t)
                    (org-agenda-todo-ignore-scheduled 'future)))
            (tags-todo "-INBOX"
                       ((org-agenda-overriding-header "Next Actions")
                        (org-agenda-tags-todo-honor-ignore-options t)
                        (org-agenda-todo-ignore-scheduled 'future)
                        (org-agenda-skip-function
                         '(lambda ()
                            (or (org-agenda-skip-subtree-if 'todo '("HOLD" "WAITING"))
                                (org-agenda-skip-entry-if 'nottodo '("NEXT")))))
                        (org-tags-match-list-sublevels t)
                        (org-agenda-sorting-strategy
                         '(todo-state-down effort-up category-keep priority-down))))
            (tags-todo ,active-project-match
                       ((org-agenda-overriding-header "Projects")
                        (org-tags-match-list-sublevels t)
                        (org-agenda-sorting-strategy
                         '(category-keep priority-down))))
            (tags-todo "-INBOX/-NEXT"
                       ((org-agenda-overriding-header "Orphaned Tasks")
                        (org-agenda-tags-todo-honor-ignore-options t)
                        (org-agenda-todo-ignore-scheduled 'future)
                        (org-agenda-skip-function
                         '(lambda ()
                            (or (org-agenda-skip-subtree-if 'todo '("PROJECT" "HOLD" "WAITING" "DELEGATED" "SOMEDAY" "GOAL"))
                                (org-agenda-skip-subtree-if 'nottododo '("TODO")))))
                        (org-tags-match-list-sublevels t)
                        (org-agenda-sorting-strategy
                         '(category-keep priority-down))))
            (tags-todo "/WAITING"
                       ((org-agenda-overriding-header "Waiting")
                        (org-agenda-tags-todo-honor-ignore-options t)
                        (org-agenda-todo-ignore-scheduled 'future)
                        (org-agenda-sorting-strategy
                         '(category-keep))))
            (tags-todo "/GOAL"
                       ((org-agenda-overriding-header "Goal")
                        (org-agenda-tags-todo-honor-ignore-options t)
                        (org-agenda-todo-ignore-scheduled 'future)
                        (org-agenda-sorting-strategy
                         '(category-keep priority-down))))
            (tags "/DONE|CANCELLED"
                  ((org-agenda-overriding-header "Done")
                   (org-agenda-tags-todo-honor-ignore-options t)
                   (org-agenda-todo-ignore-scheduled 'future)
                   (org-agenda-sorting-strategy
                    '(category-keep))))
            (tags-todo "/SOMEDAY"
                       ((org-agenda-overriding-header "Someday")
                        (org-agenda-tags-todo-honor-ignore-options t)
                        (org-agenda-todo-ignore-scheduled 'future)
                        (org-agenda-sorting-strategy
                         '(category-keep))))
            (tags-todo "/DELEGATED"
                       ((org-agenda-overriding-header "Delegated")
                        (org-agenda-tags-todo-honor-ignore-options t)
                        (org-agenda-todo-ignore-scheduled 'future)
                        (org-agenda-sorting-strategy
                         '(category-keep))))
            (tags-todo "-INBOX"
                       ((org-agenda-overriding-header "On Hold")
                        (org-agenda-skip-function
                         '(lambda ()
                            (or (org-agenda-skip-subtree-if 'todo '("WAITING"))
                                (org-agenda-skip-entry-if 'nottodo '("HOLD")))))
                        (org-tags-match-list-sublevels nil)
                        (org-agenda-sorting-strategy
                         '(category-keep))))
            ;; (tags-todo "-NEXT"
            ;;            ((org-agenda-overriding-header "All other TODOs")
            ;;             (org-match-list-sublevels t)))
            )))))


;; (add-hook 'org-agenda-mode-hook 'hl-line-mode)


;;; Agenda files
(setq org-agenda-files (list "~/spike-docs/org/work.org"))


;;; Capture templates
;;; Private

(setq org-capture-templates
      '(
        ("d" "Daily Tasks" plain (file+olp+datetree "~/daily.org") (file "~/spike-docs/org/template/daily.txt") :jump-to-captured t :immediate-finish t)))

(setq
 org-latex-listings 'minted
 org-latex-packages-alist '(("" "minted"))
 org-latex-to-pdf-process
 '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
   "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
   "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))


(setq org-startup-folded nil)


;;; To-do settings
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "REPEAT(r)" "PROJECT(p)" "SOMEDAY(s!)" "WAITING(w@/!)" "DELEGATED(e!)" "HOLD(h)" "|" "DONE(d!/!)" "CANCELLED(c@/!)")))
      org-todo-repeat-to-state "REPEAT")


;;; Mobile Org Settings
;;; https://mobileorg.github.io/documentation/#syncing-with-mobileorg
;; Set to the location of your Org files on your local system
(setq org-directory "~/org-roam")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/inbox.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")


;;; setup org-modern
;; (maybe-require-package 'org-modern)
;; (with-eval-after-load 'org (global-org-modern-mode))
;; (setq org-modern-block-name '(("src" . t) ("quote" "[" "]") ("example" . t)))
;; (setq org-modern-timestamp nil)
;; (setq org-modern-todo nil)
;; (setq org-modern-checkbox nil)
;; (setq org-modern-tag nil)
;; (setq org-modern-progress nil)



(setq org-html-html5-fancy t)
(setq org-html-doctype "html5")


(push (expand-file-name "lisp/my-lisp/org-menu" user-emacs-directory) load-path)
(with-eval-after-load 'org
  (require 'org-menu)
  (define-key org-mode-map (kbd "C-c m") 'org-menu))


(provide 'init-my-org)                  ;
;;; init-my-org.el ends here
