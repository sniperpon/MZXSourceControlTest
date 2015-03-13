;;; Put this in ~/.emacsd
;;; To start using: M-x mzxedit-mode
;;; To debug this, select "Emacs-Lisp" and tell it to eval buffer
;;;
;;; Referenced this tutorial:  http://ergoemacs.org/emacs/elisp_syntax_coloring.html

(setq auto-mode-alist 
      (append '((".*\\.rob\\'" . mzxedit-mode))
              auto-mode-alist))

;; Define element lists where appropriate
(setq mzx-keywords '("end" "go" "abort" "loop" "ask" "avalanche" "become" "nonlavawalker" "nonpushable" "lavawalker" "pushable" "blind" "board" "bulletcolor" "bullete" "bulletn" "bullets" "bulletw" "center" "mesg" "change" "char" "id" "overlay" "sfx" "thick" "arrow" "char" "edit" "clear" "mesg" "clip" "input" "color" "fade" "in" "out" "intensity" "percent" "copy" "block" "copyrobot" "cycle" "dec" "die" "item" "disable" "edge" "saving" "divide" "double" "duplicate" "self" "end" "mod" "play" "sam" "endgame" "endlife" "enable" "sensoronly" "saving" "enemy" "exchange" "position" "explode" "firewalker" "fillhealth" "flip" "freezetime" "give" "givekey" "goto" "gotoxy" "half" "if" "string" "matches" "not" "inc" "input" "string" "jump" "mod" "order" "laybomb" "high" "lazerwall" "load" "palette" "lockplayer" "attack" "ew" "ns" "lockscroll" "lockself" "start" "message" "row" "mod" "fade" "sam" "modulo" "move" "all" "multiply" "neutral" "open" "persistent" "go" "play" "sfx" "push" "put" "rel" "counters" "player" "self" "resetview" "restore" "rotatecw" "rotateccw" "save" "scroll" "scrollarrow" "scrollbase" "scrollcorner" "scrollpointer" "scrolltitle" "scrollview" "send" "set" "shoot" "shootmissile" "shootseeker" "slowtime" "spitfire" "status" "counter" "swap" "world" "switch" "take" "takekey" "teleport" "trade" "try" "unlockplayer" "unlockscroll" "unlockself" "viewport" "size" "volume" "wait" "walk" "wind" "write" "zap") )
(setq mzx-directions '("NORTH" "SOUTH" "EAST" "WEST" "IDLE" "NODIR" "ANYDIR" "RANDNS" "RANDEW" "RANDNE" "RANDNB" "RANDB" "SEEK" "FLOW" "RANDANY" "UNDER" "BENEATH") )

;; Define regexp elements
(setq mzx-keywords-regexp (regexp-opt mzx-keywords 'words))
(setq mzx-directions-regexp (regexp-opt mzx-directions 'words))
(setq mzx-numbers-regexp "\[0-9]+")

;; Clean up the memory for our unneeded lists
(setq mzx-keywords nil)
(setq mzx-directions nil)

;; Create a list for font-lock, give each type a different look
;; font-lock-type-face          = green
;; font-lock-builtin-face       = dark blue
;; font-lock-constant-face      = cyan
;; font-lock-function-name-face = blue
;; font-lock-keyword-face       = purple
(setq mzx-font-lock-keywords
      `(
	(,mzx-keywords-regexp . font-lock-builtin-face)
	(,mzx-directions-regexp . font-lock-constant-face)
	(,mzx-numbers-regexp . font-lock-type-face)
	(font-lock-keywords-case-fold-search case-insensitive)  ; This doesn't work, alas?
	(case-fold-search case-insensitive)                     ; This doesn't work, alas?
))

;; Set up our mode
(define-derived-mode mzxedit-mode fundamental-mode
  "mzxedit mode"
  "Major mode for editing Megazeux Robotic code"

  ;; Set up the syntax highlighting
  (setq font-lock-defaults '(mzx-font-lock-keywords))

  ;; Clean up our memory
  (setq mzx-keywords-regexp nil)
  (setq mzx-directions-regexp nil)
  (setq mzx-numbers-regexp nil)
)
