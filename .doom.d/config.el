;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(setq user-full-name "Travis Alongi"
      user-mail-address "travis.alongi@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom.

;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font'

(setq doom-font (font-spec :family "SF Mono" :size 22)
      doom-variable-pitch-font (font-spec :family "Iosevka SS09" :size 15)
      doom-big-font (font-spec :family "SF Mono" :size 28))

;; THEME
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Zephyrus_share/Org/")
(setq display-line-numbers-type t)
(setq vterm--term "/bin/zsh")
(setq shell-file-name "/bin/zsh")
(setq display-line-numbers-type 'relative)
(setq-default fill-column 80)
(setq recentf-max-saved-items 250)
(setq recentf-max-menu-items 50)


(define-key evil-normal-state-map  (kbd "SPC z z") 'zoxide-travel)
(define-key evil-normal-state-map  (kbd "SPC d w") 'define-word-at-point)

;; (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
;; (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; Improve org mode looks
(setq org-startup-indented t
        org-pretty-entities t
        org-hide-emphasis-markers t
        org-startup-with-inline-images t
        org-image-actual-width '(500))
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.1))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.1))))
  )

;; DIRED customizations
(use-package dired
  :ensure nil
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
  "h" 'dired-up-directory
  "l" 'dired-view-file))
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(use-package dired-open
  :config
  (add-to-list 'dired-open-functions #'dired-open-xdg t)
(setq dired-open-extensions '(("gif" . "mpv")
                              ("jpg" . "sxiv")
                              ("pdf" . "zathura")
                              ("png" . "sxiv")
                              ("mkv" . "mpv")
                              ("mp4" . "mpv"))))

(add-hook 'python-mode-hook 'anaconda-mode)
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))


;; Distraction-free screen
(use-package olivetti
    :init
    (setq olivetti-body-width .50)
    :config
    (defun distraction-free ()
      "Distraction-free writing environment"
      (interactive)
      (if (equal olivetti-mode nil)
          (progn
            (window-configuration-to-register 1)
            (delete-other-windows)
            (olivetti-mode t))
        (progn
          (jump-to-register 1)
          (olivetti-mode 0)
          (text-scale-decrease 1.5))))
    :bind
    (("<f9>" . distraction-free)))

(autoload 'ispell-get-word "ispell")
(require 'evil-snipe)
(evil-snipe-override-mode 1)
;; (require 'centered-cursor-mode)
;; (global-centered-cursor-mode 1)
(require 'zoxide)

;; (require 'openwith)
;; (openwith-mode t)
;; (setq openwith-associations '(("\\.pdf\\'" "zathura" (file))))
;; (setq openwith-associations '(("\\.png\\'" "sxiv" (file))))
;; (setq openwith-associations '(("\\.PNG\\'" "sxiv" (file))))
;; (setq openwith-associations '(("\\.jpg\\'" "sxiv" (file))))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one `use-package!'
;; - for configuring packages `after!' for running code after a package has
;; - loaded `add-load-path!' for adding directories to the `load-path', relative
;; - to ;; this file. Emacs searches the `load-path' when you load packages with
;; - ;; `require' or `use-package'. `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
