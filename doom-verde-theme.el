;;; doom-verde-theme.el --- inspired by Atom Spacegrey Dark -*- no-byte-compile: t; -*-
(require 'doom-themes)

(defgroup doom-verde-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-verde-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-verde-theme
  :type 'boolean)

(defcustom doom-verde-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-verde-theme
  :type 'boolean)

(defcustom doom-verde-comment-bg doom-verde-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-verde-theme
  :type 'boolean)

(defcustom doom-verde-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-verde-theme
  :type '(choice integer boolean))

;;
(def-doom-theme doom-verde
  "A dark theme inspired by Atom Spacegrey Dark"

  ;; name        default   256       16
  ((bg         '("#2E3233" nil       nil            ))
   (bg-alt     '("#292B2C" nil       nil            ))
   (base0      '("#1B2229" "black"   "black"        ))
   (base1      '("#29272B" "#29272B" "brightblack"  ))
   (base2      '("#404749" "#343036" "brightblack"  ))
   (base3      '("#495154" "#3E3A40" "brightblack"  ))
   (base4      '("#515B5E" "#564E58" "brightblack"  ))
   (base5      '("#767D7F" "#65737E" "brightblack"  ))
   (base6      '("#9A9F9F" "#6b6b6b" "brightblack"  ))
   (base7      '("#BEC1BF" "#979797" "brightblack"  ))
   (base8      '("#E2E3DF" "#E2E3DF" "white"        ))
   (fg         '("#FFFEFC" "#FFFEFC" "brightwhite"  ))
   (fg-alt     '("#c0c5ce" "#c0c5ce" "white"        ))

   (grey       '("#909484" "#909484"))
   (red        '("#F95738" "#F95738" "red"          ))
   (orange     '("#EE964B" "#EE964B" "brightred"    ))
   (green      '("#9FBF45" "#81B145" "green"        ))
   (alt-green  '("#81b145" "#81b145" "altgreen"))
   (blue       '("#5171A5" "#5171A5" "brightblue"   ))
   (violet     '("#cac3db" "#5B507A" "brightmagenta"))
   (teal       '("#41806B" "#41806B" "brightgreen"  ))
   (yellow     '("#ECBE7B" "#ECBE7B" "yellow"       ))
   (dark-blue  '("#2A5C85" "#2A5C85" "blue"         ))
   (magenta    '("#c678dd" "#c678dd" "magenta"      ))
   (cyan       '("#00A6FB" "#00A6FB" "brightcyan"   ))
   (dark-cyan  '("#174B75" "#174B75" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      green)
   (vertical-bar   (doom-darken bg 0.25))
   (selection      base3)
   (builtin        green)
   (comments       (if doom-verde-brighter-comments dark-cyan base5))
   (doc-comments   (doom-lighten (if doom-verde-brighter-comments dark-cyan base5) 0.25))
   (constants      green)
   (functions      grey)
   (keywords       green)
   (methods        blue)
   (operators      fg)
   (type           yellow)
   (strings        alt-green)
   (variables      teal)
   (numbers        green)
   (region         selection)
   (error          red)
   (warning        red)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg-alt) "black" "black"))
   (-modeline-bright doom-verde-brighter-modeline)
   (-modeline-pad
    (when doom-verde-padded-modeline
      (if (integerp doom-verde-padded-modeline) doom-verde-padded-modeline 4)))



   ;; --- Modeline config -------------------

   (modeline-fg     nil)
   (modeline-fg-alt (doom-blend teal base4 (if -modeline-bright 0.5 0.2)))

   (modeline-bg
    (if -modeline-bright
        (doom-darken base3 0.05)
      base1))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken base3 0.1)
      base1))
   (modeline-bg-inactive (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(doom-darken (car bg-alt) 0.05) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)

   (font-lock-comment-face
    :foreground comments
    :background (if doom-verde-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))


	 (orderless-match-face-0 :foreground  green :bold t :background base0)
   (orderless-match-face-1 :foreground  yellow :bold t :background base0)
   (orderless-match-face-2 :foreground  cyan :bold t :background  base0)
   (orderless-match-face-3 :foreground  magenta :bold t :background base0)

	 
	 
   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground green)
   (css-property             :foreground fg)
   (css-selector             :foreground red)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-darken bg 0.1))

   ;; org-mode
   (org-block            :background (doom-darken bg-alt 0.04))
   (org-block-begin-line :foreground base4 :slant 'italic :background (doom-darken bg 0.04))
	 ;;  (org-block            :background (doom-darken bg 0.04))
	 ;;  (org-block-begin-line :foreground base4 :slant 'italic )

	 ;; ((org-block &override) :background base2)
   ;; ((org-block-background &override) :background base2)
   ;; ((org-block-begin-line &override) :background base2)

	 
   ((outline-1 &override) :foreground fg :weight 'ultra-bold)
   ((outline-2 &override) :foreground (doom-blend fg blue 0.35))
   ((outline-3 &override) :foreground (doom-blend fg blue 0.7))
   ((outline-4 &override) :foreground blue)
   ((outline-5 &override) :foreground (doom-blend magenta blue 0.2))
   ((outline-6 &override) :foreground (doom-blend magenta blue 0.4))
   ((outline-7 &override) :foreground (doom-blend magenta blue 0.6))
   ((outline-8 &override) :foreground fg)

   (org-ellipsis         :underline nil :background bg    :foreground "#6BA327")
   ((org-quote &override) :background base1)

   (org-hide :foreground bg)
   (solaire-org-hide-face :foreground hidden)


	 ;;(wgrep-face :background base1)

   (ediff-current-diff-A        :foreground red   :background (doom-lighten red 0.8))
   (ediff-current-diff-B        :foreground green :background (doom-lighten green 0.8))
   (ediff-current-diff-C        :foreground blue  :background (doom-lighten blue 0.8))
   (ediff-current-diff-Ancestor :foreground teal  :background (doom-lighten teal 0.8))

	 
;;;; make tags and dates to have pretty box around them
   ;;((org-tag &override)   :foreground fg :background base1
   ;;:box `(:line-width -1 :color ,base5 :style 'released-button))
	 ;;  ((org-date &override)  :foreground fg :background base1
   ;;:box `(:line-width -1 :color ,base5  :style 'released-button))

   (tooltip              :background bg-alt :foreground fg))

  ;; --- extra variables ---------------------
  ;; ()
  )

;;; doom-verde-theme.el ends here
