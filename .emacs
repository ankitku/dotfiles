;(setq LaTeX-command-style '(("" "%(PDF)%(latex) -file-line-error %S%(PDFout)")))
;; ____________________________________________________________________________
;; Aquamacs custom-file warning:
;; Warning: After loading this .emacs file, Aquamacs will also load
;; customizations from `custom-file' (customizations.el). Any settings there
;; will override those made here.
;; Consider moving your startup settings to the Preferences.el file, which
;; is loaded after `custom-file':
;; ~/Library/Preferences/Aquamacs Emacs/Preferences
;; _____________________________________________________________________________

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)


;;(menu-bar-mode)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode 0)

(add-to-list 'load-path "~/.emacs.d/packages")

;; powerline
(add-to-list 'load-path "~/.emacs.d/packages/emacs-powerline")
(require 'powerline)
(require 'cl)

(setq powerline-default-separator 'utf-8)
(setq powerline-image-apple-rgb t)
(setq powerline-arrow-shape 'arrow14)
(load "~/.emacs.d/packages/emacs-powerline/powerline.el")

;;magit
(global-set-key (kbd "C-x g") 'magit-status)

;;windmove
(windmove-default-keybindings)

;;lisp settings
(package-initialize)

(load "/Users/ankitku/.emacs-acl2.el")
(load "/Users/ankitku/Downloads/send-form.lisp")
(put 'match 'lisp-indent-function 'defun)

;;user agent to connect to melpa
(require 'url-http)
(defun url-http-user-agent-string ()
  "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.80 Safari/537.36
")
(setq url-mime-charset-string "en-US,en;q=0.8")
(setq url-mime-encoding-string "gzip, deflate, sdch")


(require 'package)

;; Add melpa package source when using package list
;; Package.el stuff
(setq package-archives '(
                        ("elpa" . "http://tromey.com/elpa/")
                        ("gnu" . "http://elpa.gnu.org/packages/")
                        ("marmalade" . "http://marmalade-repo.org/packages/")
                        ("melpa-stable" . "http://stable.melpa.org/packages/")))

(require 'gnutls)
(add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem")

;; Load emacs packages and activate them
;; This must come before configurations of installed packages.
;; Don't delete this line.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/vendor/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/vendor/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")


;;TeX
(require 'latex-pretty-symbols)
(add-hook 'TeX-mode-hook 'prettify-symbols-mode)

(setq line-number-mode t)
(setq column-number-mode t)
(setq visible-bell t)
(setq fill-column 70)
(setq default-major-mode 'text-mode)
(setq text-mode-hook
      '(lambda () (auto-fill-mode 1)))
(add-hook 'text-mode 'turn-on-auto-fill)
(show-paren-mode 1)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (leuven)))
 '(custom-safe-themes
   (quote
    ("0b2e94037dbb1ff45cc3cd89a07901eeed93849524b574fa8daa79901b2bfdcf" default))))
(custom-set-faces
 ;; xz
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
;(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line

(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))

(add-to-list 'auto-mode-alist '("\\.sml\\'" . sml-mode))

(load "/Users/ankitku/.opam/4.02.1/share/emacs/site-lisp/tuareg-site-file")
(require 'tuareg)

(setq exec-path-from-shell-arguments '("-i"))

(setq load-path (cons "/Users/ankitku/.emacs.d/packages/sml-mode-5.0" load-path))
(load "sml-mode-startup")

(setenv "PATH" (concat "/usr/local/smlnj/bin:" (getenv "PATH")))
(setq exec-path (cons "/usr/local/smlnj/bin"  exec-path))

;; if less height, then split vertically
(setq split-height-threshold nil)
(setq split-width-threshold 160)


;;show recently opened files at startup
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
