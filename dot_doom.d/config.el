;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "fuco"
      user-mail-address "fuco@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; JetBrainsMono ExtraBold
;; Source Code Pro Semibold
(setq doom-font (font-spec :family "Noto Sans Mono" :size 18))
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;; (setq doom-font (font-spec :family "jetBrains Mono ExtraBold" :size 12 :weight 'semi-light))
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; doom-monokai-classic
;; sanityinc-tomorrow-blue
;; doom-horizon
;; doom-moonlight
;;
(setq doom-theme 'doom-one)
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
;;(load-file "~/emacsconfig/my-init.el")
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq display-line-numbers-type 'relative)
(setq! evil-insert-state-cursor '(hbar . 4))
(setq-default c-basic-offset tab-width)
(map! :leader "v" #'er/expand-region)
(map! :leader "TAB" #'next-buffer)
(map! :leader "j" #'avy-goto-char-timer)
(setq-default line-spacing 0)

;; snipet
;;(setq yas-snippet-dirs '("~/emacsconfig/snippets"))
;; competitive programming
(defun bury-compile-buffer-if-successful (buffer string)
  "bury a compilation buffer if succeeded without warnings "
  (when (and
         (buffer-live-p buffer)
         (string-match "compilation" (buffer-name buffer))
         (string-match "finished" string)
         (not
          (with-current-buffer buffer
            (goto-char (point-min))
            (search-forward "warning" nil t))))
    (run-with-timer 1 nil
                    (lambda (buf)
                      (bury-buffer buf)
                      (delete-windows-on buf))
                    buffer)))

(add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)

(fset 'compile-file
      (kmacro-lambda-form [escape ?\M-x ?s ?m ?a ?r ?t ?- ?c ?o ?m ?p ?i ?l ?e return return] 0 "%d"))
(global-set-key (kbd "<f9>") 'compile-file)

(fset 'open-term3
   (kmacro-lambda-form [escape ?\M-x ?v ?t ?e ?r ?m return return ?c ?l ?e ?a ?r return ?r ?r] 0 "%d"))
(global-set-key (kbd "<f8>") 'open-term3)


;; python
(after! lsp-python-ms                                                                                               ;;
   (set-lsp-priority! 'mspyls 1))                                                                                    ;;
;;(add-hook! 'python-mode-hook #'prettify-symbols-mode)
(defun my-cc ()
  (c-set-style "gnu")
  ;;(turn-off-smartparens-mode))

  )
(add-hook! 'c++-mode-hook 'my-cc)
;;(add-hook! 'c++-mode-hook #'turn-off-smartparens-mode)
;;(add-hook! 'c++-mode-hook '(lambda () (c-set-style "gnu")))
(setq! highlight-indent-guides-method 'column)
(global-display-fill-column-indicator-mode)
;;(require global-display-fill-column-indicator-mode 1)
;; option bitmap, character
;;(setq! highlight-indent-guides-method 'bitmap)
(eval-after-load 'vterm
  '(fullframe vterm quit-window))
