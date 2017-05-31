;; Caleb Foust's init.el file.
;; I realized that my .vim configuration was asymptotically
;; approaching something similar to Spacemacs. It seemed too
;; heavy for my tastes, so I'm starting from scratch. Go
;; figure.

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

;; Similar to how vim's Vundle is useful for having the same packages
;; across systems, this feature of use-package installs packages
;; automatically if they are not present on the system already.
(setq use-package-always-ensure t)

;; Set up evil-mode, which emulates (most of) vim's bindings in emacs.
(use-package evil
   :init
   (evil-mode 1))
