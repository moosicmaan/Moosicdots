;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; ----------------------------------------------------------------------------
;; ============================================================================
;; USER INFO
;; ============================================================================
;; ----------------------------------------------------------------------------
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;      user-mail-address "john@doe.com")
(setq user-full-name "Jason Bradberry"
      user-mail-address "jason@lovepurposely.com")


;; ----------------------------------------------------------------------------
;; ============================================================================
;; APPEARANCE
;; ============================================================================
;; ----------------------------------------------------------------------------
;;
;; ----------------------------------------------------------------------------
;; TRANSPARENCY
;; ----------------------------------------------------------------------------
;;(set-frame-parameter (selected-frame) 'alpha '(70 70))
;;(set-frame-parameter (selected-frame) 'alpha 90)
;;(add-to-list 'default-frame-alist '(alpha 90 90))
(set-frame-parameter nil 'alpha-background 100)

;; ----------------------------------------------------------------------------
;; FONTS
;; ----------------------------------------------------------------------------
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;        echo "!!!!!!!!!!!!!!!!!!!!!!!!"
; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;(setq doom-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 16)
;; (setq doom-font (font-spec :family "SauceCodePro Nerd Font Propo" :size 16)
(setq doom-font (font-spec :family "MesloLGM Nerd Font Mono" :size 20 :height 1.0)
      doom-big-font (font-spec :family "MesloLGM Nerd Font Mono" :size 30 :height 1.0)
      ;; doom-big-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 24))
      doom-variable-pitch-font (font-spec :family "JetBrainsMonoNL Nerd Font Propo" :size 16))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(set-frame-font "Space Mono Nerd Font 18" nil t)

(custom-set-faces
 '(mode-line ((t (:family "MesloLGM Nerd Font Mono" :size 14))))
 '(mode-line-active ((t (:family "MesloLGM Nerd Font Mono Bold" :size 14))))
 '(mode-line-inactive ((t (:family "MesloLGM Nerd Font Mono" :size 14)))))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

;; ----------------------------------------------------------------------------
;; RAINBOW MODE
;; ----------------------------------------------------------------------------
;;Rainbox mode displays the actual color for any hex value color.
;;It’s such a nice feature that I wanted it turned on all the time,
;;regardless of what mode I am in.
;;The following creates a global minor mode for rainbow-mode and enables it
;;(exception: org-agenda-mode since rainbow-mode
;;destroys all highlighting in org-agenda).
(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda ()
    (when (not (memq major-mode '(org-agenda-mode)))
      (rainbow-mode 1)))
  :group 'rainbow-mode) ;; Specify the customization group

;; ----------------------------------------------------------------------------
;; CIRCE UI
;; ----------------------------------------------------------------------------
;; This is a simple list of font faces for various Circe UI elements.
(after! circe
  (custom-set-faces!
    '(circe-prompt-face :foreground "#0ef")
    '(circe-server-face :foreground "#ee0")
    '(circe-my-message-face :weight bold :foreground "#f44")
    '(circe-originator-face :foreground "b4f"))
  (add-hook! 'circe-mode-hook 'garbage-collect))

;; ----------------------------------------------------------------------------
;; EYE CANDY
;; ----------------------------------------------------------------------------
;; jdb -->
(when (display-graphic-p)
  (require 'all-the-icons))
;;(require 'all-the-icons-dired-mode)
;; JDB ---> display choices/selection in the middle instead of mini buffer
(require 'vertico-posframe)
(vertico-posframe-mode 1)
(setq vertico-posframe-parameters
'((left-fringe . 8)
        (right-fringe . 8)))
(setq vertico-posframe-border-width
'5)
;; <--- jdb

;;Never lose your cursor.  When you scroll, your cursor will shine!
;;This is a global minor-mode. Turn it on everywhere with:
(beacon-mode 1)

;; ----------------------------------------------------------------------------
;; THEME
;; ----------------------------------------------------------------------------
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-homage-black)
;; (setq doom-theme 'manoj-dark)
(setq doom-theme 'doom-dracula)
;; (setq doom-theme 'doom-monokai-ristretto)
;; (setq doom-theme 'doom-challenger-deep)
;; (setq doom-theme 'ewal-doom-vibrant)
;; (setq doom-theme 'ewal-doom-one)
;; (setq doom-theme 'doom-outrun-electric)
;; (setq doom-theme 'catppuccin)
;; (setq doom-theme 'modus-vivendi-deuteranopia)

(setq inhibit-splash-screen t)
(transient-mark-mode 1)
(require 'org)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; ----------------------------------------------------------------------------
;; TABS and INDENT
;; ----------------------------------------------------------------------------
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 2)
(add-hook 'before-save-hook #'whitespace-cleanup)
(setq-default fill-column 120)
(global-display-fill-column-indicator-mode t)

;; ----------------------------------------------------------------------------
;; DASHBOARD
;; ----------------------------------------------------------------------------
(let ((banners '("squaree.png"
                "bluee.png"
                "purplee.png"
                "emacs.png"
                "emacsapple.png"
                "doomEmacsGruvbox.png"
                "doomEmacsRouge.png"
                "doomEmacsSolarized.png"
                "doomEmacsTokyoNight.png"
                "doomWithShadow.png"
                "doomEmacsDoomOne.png"
                "doomEmacsGray.png"
                "doomEmacsBright.png"
                "doomie.png"
                "iAmDoom.png"
                "gnu.png"
                "floatingGnu.png"
                "pattern.png"
                "ue-colorful.png"
                "ue-light.png"
                "ue-red.png"
                "mx-butterfly.png"
                "vaporwave.png"
                "rings.png"
                "gnu-colors.png"
                "spacemacs.png"
                "emacsNeon.png"
                "doomieScary.png"
                "fancyEmacs.png")))
(setq fancy-splash-image
        (concat doom-private-dir "splash/"
                (nth (random (length banners)) banners))))

;;(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

;; ----------------------------------------------------------------------------
;; MARGINALIA - included with DOOM, but put here to ensure extras are in vertico
;; ----------------------------------------------------------------------------
;; Show lots of useful stuff in the minibuffer
(use-package marginalia
  :after vertico
  :ensure t
  :init
  (marginalia-mode))

;; ----------------------------------------------------------------------------
;; ============================================================================
;; ORG
;; ============================================================================
;; ----------------------------------------------------------------------------
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "/mnt/data/moosicmaan/ORG/agenda/"
  org-ellipsis " ▼ "
  org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆")
  org-superstar-itembullet-alist '((?+ . ?➤) (?- . ?✦))) ; changes +/- symbols in item lists)

(setq org-todo-keywords          ; This overwrites the default Doom org-todo-keywords
    '((sequence
       "TODO(t)"           ; A task that is ready to be tackled
       "BLOG(b)"           ; Blog writing assignments
       "GYM(g)"            ; Things to accomplish at the gym
       "PROJ(p)"           ; A project that contains other tasks
       "VIDEO(v)"          ; Video assignments
       "WAIT(w)"           ; Something is holding up this task
       "|"                 ; The pipe necessary to separate "active" states and "inactive" states
       "DONE(d)"           ; Task has been completed
       "CANCELLED(c)" )))  ; Task has been cancelled

(font-lock-add-keywords 'org-mode
  '(("^ *\\([-]\\) "
  (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Make org mode display in veriable pitch unless cusomized
(add-hook 'org-mode-hook 'variable-pitch-mode)

;; Make sure and preserve indents in tangle
(setq org-src-preserve-indentation t)

;; Toc-Org - Allows us to create a Table of Contents in our Org docs.
(use-package toc-org
    :commands toc-org-enable
    :init (add-hook 'org-mode-hook 'toc-org-enable))

(setq
  ;; Edit settings
  org-auto-align-tags nil
  org-tags-column 0
  org-catch-invisible-edits 'show-and-error
  org-special-ctrl-a/e t
  org-insert-heading-respect-content t

  ;; Org styling, hide markup etc.
  org-hide-emphasis-markers t
  org-pretty-entities t
)

(custom-theme-set-faces
 'user
 '(org-level-1 ((t (:inherit outline-1 :extend t :weight ultra-bold :height 2.0))))
 '(org-level-2 ((t (:inherit outline-2 :extend t :weight extra-bold :height 1.7))))
 '(org-level-3 ((t (:inherit outline-3 :extend t :weight bold :height 1.5))))
 '(org-level-4 ((t (:inherit outline-4 :extend t :weight semi-bold :height 1.40))))
 '(org-level-5 ((t (:inherit outline-5 :extend t :weight normal :height 1.30))))
 '(org-level-6 ((t (:inherit outline-6 :extend t :weight normal :height 1.20))))
 '(org-level-7 ((t (:inherit outline-7 :extend t :weight normal :height 1.10))))
 '(org-level-8 ((t (:inherit outline-8 :extend t :weight normal :height 1.00))))
 '(org-block ((t (:inherixed-pitch))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-info ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-link ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch)))))
)

;; ----------------------------------------------------------------------------
;; ORG AGENDA
;; ----------------------------------------------------------------------------
(setq
 calendar-week-start-day 1
 ;; Agenda styling
 org-agenda-tags-column 0
 org-agenda-block-separator ?─
 org-agenda-time-grid
 '((daily today require-timed)
 (800 1000 1200 1400 1600 1800 2000)
 " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
 org-agenda-current-time-string
 "◀── now ────────────────"
 )

(after! org
  (setq agenda-file '("/mnt/scsi/data/moosicmaan/AGENDA/LPtd.org")))

(org-fancy-priorities-mode)

(setq
   ;; org-fancy-priorities-list '("[A]" "[B]" "[C]")
   org-fancy-priorities-list '("❗" "🚸" "🐢")
   ;;org-fancy-priorities-list '("🟥" "🟧" "🟨")
   org-priority-faces
   '((?A :foreground "#ff6c6b" :weight bold)
     (?B :foreground "#98be65" :weight bold)
     (?C :foreground "#c678dd" :weight bold))
   org-agenda-block-separator 8411)

(setq org-agenda-custom-commands
  '(("v" "A better agenda view"
    ((agenda "")
    (tags "PRIORITY=\"A\""
           ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
            (org-agenda-skip-function '(org-agenda-skip-entry-if 'notscheduled))
            (org-agenda-overriding-header "HIGH-PRIORITY:")))
    (tags "PRIORITY=\"B\""
           ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
            (org-agenda-skip-function '(org-agenda-skip-entry-if 'notscheduled))
            (org-agenda-overriding-header "MEDIUM-PRIORITY:")))
    (tags "PRIORITY=\"C\""
           ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
            (org-agenda-skip-function '(org-agenda-skip-entry-if 'notscheduled))
            (org-agenda-overriding-header "LOW-PRIORITY:")))
    (tags "customtag"
           ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
            (org-agenda-skip-function '(org-agenda-skip-entry-if 'notscheduled))
            (org-agenda-overriding-header "Tasks marked with customtag:")))

     (alltodo "")))))

;;Some custom functions to insert the date.
;;The function ‘insert-todays-date’ can be used one of three different ways:
;;(1) just the keybinding without the universal argument prefix,
;;(2) with one universal argument prefix, or
;;(3) with two universal argument prefixes.
;;The universal argument prefix is ‘SPC-u’ in Doom Emacs (C-u in standard GNU Emacs).
;;The function ‘insert-any-date’ only outputs to one format,
;;which is the same format as ‘insert-todays-date’ without a prefix.
;;COMMAND
;;EXAMPLE OUTPUT
;;KEYBINDING

;;jdb/insert-todays-date
;;Friday, November 19, 2021
;;SPC i d t

;;jdb/insert-todays-date
;;11-19-2021
;;SPC u SPC i d t

;;jdb/insert-todays-date
;;2021-11-19
;;SPC u SPC u SPC i d t

;;jdb/insert-any-date
;;Friday, November 19, 2021
;;SPC i d a

(defun jdb/insert-todays-date (prefix)
  (interactive "P")
  (let ((format (cond
       ((not prefix) "%A, %B %d, %Y")
       ((equal prefix '(4)) "%m-%d-%Y")
       ((equal prefix '(16)) "%Y-%m-%d"))))
     (insert (format-time-string format))))

(require 'calendar)
(defun jdb/insert-any-date (date)
  "Insert DATE using the current locale."
  (interactive (list (calendar-read-date)))
  (insert (calendar-date-string date)))

(map! :leader
      (:prefix ("i d" . "Insert date")
        :desc "Insert any date"    "a" #'jdb/insert-any-date
        :desc "Insert todays date" "t" #'jdb/insert-todays-date))

;; ----------------------------------------------------------------------------
;; ORG ADDONS
;; ----------------------------------------------------------------------------
;; (use-package org2blog
;;              :ensure t)

;; ----------------------------------------------------------------------------
;; CALENDAR
;; ----------------------------------------------------------------------------
;; https://stackoverflow.com/questions/9547912/emacs-calendar-show-more-than-3-months
(defun jdb/year-calendar (&optional year)
  (interactive)
  (require 'calendar)
  (let* (
      (current-year (number-to-string (nth 5 (decode-time (current-time)))))
      (month 0)
      (year (if year year (string-to-number (format-time-string "%Y" (current-time))))))
    (switch-to-buffer (get-buffer-create calendar-buffer))
    (when (not (eq major-mode 'calendar-mode))
      (calendar-mode))
    (setq displayed-month month)
    (setq displayed-year year)
    (setq buffer-read-only nil)
    (erase-buffer)
    ;; horizontal rows
    (dotimes (j 4)
      ;; vertical columns
      (dotimes (i 3)
        (calendar-generate-month
          (setq month (+ month 1))
          year
          ;; indentation / spacing between months
          (+ 5 (* 25 i))))
      (goto-char (point-max))
      (insert (make-string (- 10 (count-lines (point-min) (point-max))) ?\n))
      (widen)
      (goto-char (point-max))
      (narrow-to-region (point-max) (point-max)))
    (widen)
    (goto-char (point-min))
    (setq buffer-read-only t)))

(defun jdb/scroll-year-calendar-forward (&optional arg event)
  "Scroll the yearly calendar by year in a forward direction."
  (interactive (list (prefix-numeric-value current-prefix-arg)
                     last-nonmenu-event))
  (unless arg (setq arg 0))
  (save-selected-window
    (if (setq event (event-start event)) (select-window (posn-window event)))
    (unless (zerop arg)
      (let* (
              (year (+ displayed-year arg)))
        (jdb/year-calendar year)))
    (goto-char (point-min))
    (run-hooks 'calendar-move-hook)))

(defun jdb/scroll-year-calendar-backward (&optional arg event)
  "Scroll the yearly calendar by year in a backward direction."
  (interactive (list (prefix-numeric-value current-prefix-arg)
                     last-nonmenu-event))
  (jdb/scroll-year-calendar-forward (- (or arg 1)) event))

(map! :leader
      :desc "Scroll year calendar backward" "<left>" #'jdb/scroll-year-calendar-backward
      :desc "Scroll year calendar forward" "<right>" #'jdb/scroll-year-calendar-forward)

(defalias 'year-calendar 'jdb/year-calendar)

;; (use-package! calfw)
;; (use-package! calfw-org)

;; ----------------------------------------------------------------------------
;; ============================================================================
;; USER PROGRAMS
;; ============================================================================
;; ----------------------------------------------------------------------------
(add-to-list 'treesit-language-source-alist
        '(hyprlang "https://github.com/tree-sitter-grammars/tree-sitter-hyprlang"))

(use-package! hyprlang-ts-mode
  :custom
  (hyprlang-ts-mode-indent-offset 4))

;; ----------------------------------------------------------------------------
;; ============================================================================
;; SYSTEM/PROGRAM
;; ============================================================================
;; ----------------------------------------------------------------------------
;; JDB ---> fish issues
(setq shell-file-name (executable-find "bash"))

;; Repressing warnings
(setq byte-compile-warnings '(cl-functions))

;; ----------------------------------------------------------------------------
;; DEFAULT PROGRAMS
;; ----------------------------------------------------------------------------
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "qutebrowser")
(add-hook! 'dired-mode-hook 'garbage-collect)

;; ----------------------------------------------------------------------------
;; WARNINGS
;; ----------------------------------------------------------------------------
(setq warning-minimum-level :emergency)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq shell-file-name (executable-find "bash"))

;; ----------------------------------------------------------------------------
;; HOOKS AFTER STARTUP
;; ----------------------------------------------------------------------------
(add-hook! 'doom-dashboard-mode-hook 'garbage-collect)
(add-hook! 'doom-dashboard-mode-hook (hide-mode-line-mode 1))
(add-hook! 'doom-load-theme-hook 'garbage-collect)
(add-hook! 'doom-first-file-hook 'garbage-collect)
(add-hook! 'kill-emacs-hook 'garbage-collect)
(add-hook! 'after-init-hook 'garbage-collect)
(add-hook! 'after-init-hook 'beacon-mode)
(add-hook! 'doom-init-ui-hook 'garbage-collect)
(add-hook! 'doom-after-init-modules-hook 'garbage-collect)
(add-hook! 'eww-mode-hook 'garbage-collect)

;; ----------------------------------------------------------------------------
;; GLOBAL KEYBINGINGS
;; ----------------------------------------------------------------------------
;; Use Mouse to increase/decrease text
(global-set-key (kbd "C-<wheel-up>") 'text-scale-increase)
(global-set-key (kbd "C-<wheel-down>") 'text-scale-decrease)
(map! :leader
      :desc "Toggle Treemacs" "e" #'+treemacs/toggle)
;; ----------------------------------------------------------------------------
;; DIRED
;; ----------------------------------------------------------------------------
(map! :leader
  (:prefix ("d" . "dired")
  :desc "Open dired" "d" #'dired
  :desc "Dired jump to current" "j" #'dired-jump)
  (:after dired
    (:map dired-mode-map
        :desc "Peep-dired image previews" "d p" #'peep-dired
        :desc "Dired view file"           "d v" #'dired-view-file)))

(evil-define-key 'normal dired-mode-map
  (kbd "M-RET") 'dired-display-file
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-open-file ; use dired-find-file instead of dired-open.
  (kbd "m") 'dired-mark
  (kbd "t") 'dired-toggle-marks
  (kbd "u") 'dired-unmark
  (kbd "C") 'dired-do-copy
  (kbd "D") 'dired-do-delete
  (kbd "J") 'dired-goto-file
  (kbd "M") 'dired-do-chmod
  (kbd "O") 'dired-do-chown
  (kbd "P") 'dired-do-print
  (kbd "R") 'dired-do-rename
  (kbd "T") 'dired-do-touch
  (kbd "Y") 'dired-copy-filenamecopy-filename-as-kill ; copies filename to kill ring.
  (kbd "Z") 'dired-do-compress
  (kbd "+") 'dired-create-directory
  (kbd "-") 'dired-do-kill-lines
  (kbd "% l") 'dired-downcase
  (kbd "% m") 'dired-mark-files-regexp
  (kbd "% u") 'dired-upcase
  (kbd "* %") 'dired-mark-files-regexp
  (kbd "* .") 'dired-mark-extension
  (kbd "* /") 'dired-mark-directories
  (kbd "; d") 'epa-dired-do-decrypt
  (kbd "; e") 'epa-dired-do-encrypt)
;; Get file icons in dired
;;(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; With dired-open plugin, you can launch external programs for certain extensions
;; For example, I set all .png files to open in 'sxiv' and all .mp4 files to open in 'mpv'
(setq dired-open-extensions '(("gif" . "gwenview")
                              ("jpg" . "gwenview")
                              ("png" . "gwenview")
                              ("mkv" . "mpv")
                              ("mp4" . "mpv")))

(evil-define-key 'normal peep-dired-mode-map
  (kbd "j") 'peep-dired-next-file
  (kbd "k") 'peep-dired-prev-file)
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)

(setq delete-by-moving-to-trash t
  trash-directory "~/.local/share/Trash/files/")

;; ----------------------------------------------------------------------------
;; ============================================================================
;; INFORMATION
;; ============================================================================
;; ----------------------------------------------------------------------------
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
