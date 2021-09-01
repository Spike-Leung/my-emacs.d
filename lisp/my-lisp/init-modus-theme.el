;;; Package --- Summary
;;; init-modus-theme.el
;;; Commentary:
;;; Code:
(require-package 'modus-themes)
(setq modus-themes-italic-constructs nil
      modus-themes-bold-constructs nil
      modus-themes-no-mixed-fonts nil
      modus-themes-subtle-line-numbers nil
      modus-themes-success-deuteranopia t
      modus-themes-tabs-accented t
      modus-themes-inhibit-reload t ; only applies to `customize-set-variable' and related
      modus-themes-fringes nil ; {nil,'subtle,'intense}

      ;; Options for `modus-themes-lang-checkers' are either nil (the
      ;; default), or a list of properties that may include any of those
      ;; symbols: `straight-underline', `text-also', `background',
      ;; `intense'
      modus-themes-lang-checkers nil

      ;; Options for `modus-themes-mode-line' are either nil, or a list
      ;; that can combine any of `3d' OR `moody', `borderless',
      ;; `accented', `padded'.
      modus-themes-mode-line '(accented borderless)

      ;; Options for `modus-themes-syntax' are either nil (the default),
      ;; or a list of properties that may include any of those symbols:
      ;; `faint', `yellow-comments', `green-strings', `alt-syntax'
      modus-themes-syntax '(green-strings alt-syntax)

      ;; Options for `modus-themes-hl-line' are either nil (the default),
      ;; or a list of properties that may include any of those symbols:
      ;; `accented', `underline', `intense'
      modus-themes-hl-line '(accented)

      ;; Options for `modus-themes-paren-match' are either nil (the
      ;; default), or a list of properties that may include any of those
      ;; symbols: `bold', `intense', `underline'
      modus-themes-paren-match '(bold intense)

      ;; Options for `modus-themes-links' are either nil (the default),
      ;; or a list of properties that may include any of those symbols:
      ;; `neutral-underline' OR `no-underline', `faint' OR `no-color',
      ;; `Bold', `italic', `background'
      modus-themes-links '(neutral-underline)

      ;; Options for `modus-themes-prompts' are either nil (the
      ;; default), or a list of properties that may include any of those
      ;; symbols: `background', `bold', `gray', `intense', `italic'
      modus-themes-prompts nil;

      modus-themes-completions 'moderate ; {nil,'moderate,'opinionated}

      modus-themes-mail-citations nil ; {nil,'faint,'monochrome}

      ;; Options for `modus-themes-region' are either nil (the default),
      ;; or a list of properties that may include any of those symbols:
      ;; `no-extend', `bg-only', `accented'
      modus-themes-region '(bg-only no-extend)

      ;; Options for `modus-themes-diffs': nil, 'desaturated,
      ;; 'bg-only, 'deuteranopia, 'fg-only-deuteranopia
      modus-themes-diffs 'fg-only-deuteranopia

      modus-themes-org-blocks 'gray-background ; {nil,'gray-background,'tinted-background}

      modus-themes-org-agenda ; this is an alist: read the manual or its doc string
      '((header-block . (variable-pitch scale-title))
        (header-date . (grayscale workaholic bold-today))
        (scheduled . uniform)
        (habit . traffic-light-deuteranopia))

      modus-themes-headings ; this is an alist: read the manual or its doc string
      '((1 . (overline rainbow))
        (2 . (rainbow))
        (t . (no-bold rainbow)))

      modus-themes-variable-pitch-ui nil
      modus-themes-variable-pitch-headings t
      modus-themes-scale-headings t
      modus-themes-scale-1 1.1
      modus-themes-scale-2 1.15
      modus-themes-scale-3 1.21
      modus-themes-scale-4 1.27
      modus-themes-scale-title 1.33)
;; Load the theme files before enabling a theme (else you get an error).
(modus-themes-load-themes)
;; Load the theme of your choice:
(modus-themes-load-operandi)

(provide 'init-modus-theme)
;;; init-modus-theme.el ends here
