;; Caleb Foust's init.el file.
;; I realized that my .vim configuration was asymptotically
;; approaching something similar to Spacemacs. It seemed too
;; heavy for my tastes, so I'm starting from scratch. Go
;; figure.
(setq load-path (cons "~/.emacs.d/lib" load-path))

; Stop cursor from blinking
(blink-cursor-mode 0)
(auto-fill-mode 1)
; Hide all GUI adornments
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Use some handy package repositories.
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

;; Bootstrap use-package so that we can
;; use it for more granular package configuration.
(unless
    (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'bind-key)

;; Similar to how vim's Vundle is useful for having the same packages
;; across systems, this feature of use-package installs packages
;; automatically if they are not present on the system already.
(setq use-package-always-ensure t)

(use-package color-theme)
(color-theme-initialize)
(load "~/.emacs.d/themes/color-theme-vividchalk.el")
(color-theme-vivid-chalk)

;; Set up evil-mode, which emulates (most of) vim's bindings in emacs.
(use-package evil
   :init
   (evil-mode 1))

;; Evil-args adds text objects for arguments to evil.
;; For example, "cia" would change the inner argument to a function.
(use-package evil-args
   :init
   (define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
   (define-key evil-outer-text-objects-map "a" 'evil-outer-arg))

;;; Set up <Space> as leader in evil.
(use-package evil-leader
   :init
   (global-evil-leader-mode)
   (evil-leader/set-leader "<SPC>"))

;; Handy dandy commenting in evil
(use-package evil-nerd-commenter)
(evil-leader/set-key
    "cc" 'evilnc-comment-or-uncomment-lines
    "cu" 'evilnc-comment-or-uncomment-lines)

;;; We always want to use C-c as an escape sequence. This way we can make
;;; emacs and vim feel effectively identical. The below segment
;;; accomplishes this. It is taken from https://www.emacswiki.org/emacs/Evil.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; C-c as general purpose escape key sequence.
(defun my-esc (prompt)
  "Functionality for escaping generally.
  Includes exiting Evil insert state and C-g binding. "
  (cond
   ;; If we're in one of the Evil states that
   ;; defines [escape] key, return [escape] so as
   ;; Key Lookup will use it.
   ((or
      (evil-insert-state-p)
      (evil-normal-state-p)
      (evil-replace-state-p)
      (evil-visual-state-p)) [escape])
   ;; This is the best way I could infer for now to have C-c work during evil-read-key.
   ;; Note: As long as I return [escape] in normal-state, I don't need this.
   ;;((eq overriding-terminal-local-map evil-read-key-map) (keyboard-quit) (kbd ""))
   (t (kbd "C-g"))))
(define-key key-translation-map (kbd "C-c") 'my-esc)
;; Works around the fact that Evil uses read-event directly when in operator state, which
;; doesn't use the key-translation-map.
(define-key evil-operator-state-map (kbd "C-c") 'keyboard-quit)
;; Not sure what behavior this changes, but might as well set it, seeing the Elisp manual's
;; documentation of it.
(set-quit-char "C-c")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; HJKL are mostly pointless keys. Let's change their function in normal mode.
(define-key evil-normal-state-map (kbd "j") 'evil-scroll-down)
(define-key evil-normal-state-map (kbd "k") 'evil-scroll-up)

(use-package helm)
;; helm-projectile has similar behavior to CtrlP in vim.
(use-package helm-projectile)
;; Search through themes.
(use-package helm-themes)

(evil-leader/set-key
    ;; Find files in the project with <leader>k
    "k" 'helm-projectile-find-file
    ;; Choose from current buffers with <leader>;
    ";" 'helm-mini)

;; Function to insert blank line above. Useful for replicating functionality
;; from vimrc.
;; Taken from http://emacsredux.com/blog/2013/03/26/smarter-open-line/
(defun smart-open-line ()
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode."
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(defun smart-open-line-above ()
  "Insert an empty line above the current line.
Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (indent-according-to-mode)
  (forward-line -1))

(evil-leader/set-key
    "s" 'smart-open-line
    "S" 'smart-open-line-above)

;; Center the buffer in the middle of the screen. I think
;; splits are a waste of space, so I don't use them.
(set-fringe-mode
  (/ (- (frame-pixel-width)
        (* 100 (frame-char-width)))
     2))

(use-package magit)
(evil-leader/set-key
    "gs" 'magit-status
    "gp" 'magit-push-current-to-upstream)

(use-package powerline)
(powerline-default-theme)

(use-package auto-complete)
(ac-config-default)
