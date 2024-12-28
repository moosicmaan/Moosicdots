;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;; (package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
;; (package! another-package
;;   :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;; (package! this-package
;;   :recipe (:host github :repo "username/repo"
;;            :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;; (package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;; (package! builtin-package :recipe (:nonrecursive t))
;; (package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
;; (package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;; (package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;; (unpin! pinned-package)
;; ...or multiple packages
;; (unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;; (unpin! t)

;;JDB ---> the following from DT's config...remove if it breaks things
(package! calfw)
(package! calfw-org)
(package! dired-open)
(package! dired-subtree)
(package! dirvish)
(package! ednc)
(package! emojify)
(package! evil-tutor)
(package! imenu-list)
(package! ivy-posframe)
(package! mw-thesaurus)
(package! org-auto-tangle)
(package! org-web-tools)
;;(package! ox-gemini)
(package! peep-dired)
(package! rainbow-mode)
(package! resize-window)
(package! tldr)
(package! wc-mode)
(package! beacon)
(package! minimap)
(package! olivetti)
(package! org-bullets)

;; JDB ---> From Tanner Babcock
(package! all-the-icons)
(package! dired-sidebar)
(package! dired-hacks)
(package! helm-org-rifle)
(package! org-fancy-priorities)

;; JDB --> my installs
(package! ewal-doom-themes)
(package! page-break-lines)
(package! projectile)
(package! nerd-icons)
(package! vertico-posframe
  :recipe (:host github :repo "tumashu/vertico-posframe"))
(package! all-the-icons-dired
  :recipe (:host github :repo "jtbm37/all-the-icons-dired"))
(package! org-modern
  :recipe (:host github :repo "minad/org-modern"))
(package! toc-org)
(package! org2blog)
(package! marginalia)
(package! tree-sitter-hyprlang
  :recipe (:host github :repo "tree-sitter-grammars/tree-sitter-hyprlang"))
(package! hyprlang-ts-mode
  :recipe (:host github :repo "Nathan-Melaku/hyprlang-ts-mode"))
(package! catppuccin-theme)
