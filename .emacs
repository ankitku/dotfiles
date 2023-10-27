
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

(setq user-full-name "Ankit Kumar"
      user-mail-address "ankitkumar.itbhu@gmail.com")

(setq completion-auto-help nil)

;;(menu-bar-mode)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode 0)

(add-to-list 'load-path "~/.emacs.d/packages")
(require 'package)

;;magit
(global-set-key (kbd "C-x g") 'magit-status)

;;windmove
(windmove-default-keybindings)

;;acl2s keybindings
(load "~/dev/.emacs-acl2.el")
(load "~/dev/send-form.lisp")
(put 'match 'lisp-indent-function 'defun)

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives
               (cons "melpa" (concat proto "://melpa.org/packages/")) t))
(package-initialize)

;;user agent to connect to melpa
(require 'url-http)
(defun url-http-user-agent-string ()
  "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.80 Safari/537.36
")
(setq url-mime-charset-string "en-US,en;q=0.8")
(setq url-mime-encoding-string "gzip, deflate, sdch")

;; Add melpa package source when using package list
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
    ("marmalade" . "https://marmalade-repo.org/packages/")
    ("melpa" . "http://melpa.org/packages/")))

(require 'gnutls)
(add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem")


;; Add melpa package source when using package list
;; Package.el stuff
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")
			 ("melpa-stable" . "http://stable.melpa.org/packages/")))


(require 'gnutls)
(add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem")
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Load emacs packages and activate them
;; This must come before configurations of installed packages.
;; Don't delete this line.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/vendor/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/vendor/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/packages/")

;;Dockerfile mode
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

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
(setq tron-legacy-theme-vivid-cursor t)
(setq-default cursor-type 'bar) 
(setq tron-legacy-theme-softer-bg t)

(custom-set-faces
 ;; xz
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; if less height, then split vertically
(setq split-height-threshold nil)
(setq split-width-threshold 160)

;;enable annoying making-completion-list, which hangs emacs
(setq completion-auto-help t)
(setq lisp-mode t)

;;show recently opened files at startup
(require 'recentf)
(setq recentf-auto-cleanup 'never) ;; disable before we start recentf, else will start ssh
(recentf-mode 1)
(setq recentf-keep '(file-remote-p file-readable-p))
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;Auto indent
(define-key global-map (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C->") 'indent-rigidly-right-to-tab-stop)
(global-set-key (kbd "C-<") 'indent-rigidly-left-to-tab-stop)

;;IDO mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; org mode tweaks
(require 'org-pretty-table)
(add-hook 'org-mode-hook (lambda () (org-pretty-table-mode)))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


;; TeX settings works only with Aquamacs
(require 'latex-pretty-symbols)
(add-hook 'TeX-mode-hook 'prettify-symbols-mode)

;; Improve org mode looks
(setq org-startup-indented t
      org-pretty-entities t
      org-hide-emphasis-markers t
      org-startup-with-inline-images t
      org-image-actual-width '(300))


(setq org-emphasis-alist
  '(("*" (bold :foreground "Orange" ))
    ("/" italic)
    ("_" underline)
    ("=" (:background "maroon" :foreground "white"))
    ("~" (:background "deep sky blue" :foreground "MidnightBlue"))
    ("+" (:strike-through t))))

(defvar org-latex-fragment-last nil
  "Holds last fragment/environment you were on.")

;; show latex in org mode
(defun org-latex-fragment-toggle ()
  "Toggle a latex fragment image "
  (and (eq 'org-mode major-mode)
       (let* ((el (org-element-context))
              (el-type (car el)))
         (cond
          ;; were on a fragment and now on a new fragment
          ((and
            ;; fragment we were on
            org-latex-fragment-last
            ;; and are on a fragment now
            (or
             (eq 'latex-fragment el-type)
             (eq 'latex-environment el-type))
            ;; but not on the last one this is a little tricky. as you edit the
            ;; fragment, it is not equal to the last one. We use the begin
            ;; property which is less likely to change for the comparison.
            (not (= (org-element-property :begin el)
                    (org-element-property :begin org-latex-fragment-last))))
           ;; go back to last one and put image back
           (save-excursion
             (goto-char (org-element-property :begin org-latex-fragment-last))
             (org-preview-latex-fragment))
           ;; now remove current image
           (goto-char (org-element-property :begin el))
           (let ((ov (loop for ov in org-latex-fragment-image-overlays
                           if
                           (and
                            (<= (overlay-start ov) (point))
                            (>= (overlay-end ov) (point)))
                           return ov)))
             (when ov
               (delete-overlay ov)))
           ;; and save new fragment
           (setq org-latex-fragment-last el))

          ;; were on a fragment and now are not on a fragment
          ((and
            ;; not on a fragment now
            (not (or
                  (eq 'latex-fragment el-type)
                  (eq 'latex-environment el-type)))
            ;; but we were on one
            org-latex-fragment-last)
           ;; put image back on
           (save-excursion
             (goto-char (org-element-property :begin org-latex-fragment-last))
             (org-preview-latex-fragment))
           ;; unset last fragment
           (setq org-latex-fragment-last nil))

          ;; were not on a fragment, and now are
          ((and
            ;; we were not one one
            (not org-latex-fragment-last)
            ;; but now we are
            (or
             (eq 'latex-fragment el-type)
             (eq 'latex-environment el-type)))
           (goto-char (org-element-property :begin el))
           ;; remove image
           (let ((ov (loop for ov in org-latex-fragment-image-overlays
                           if
                           (and
                            (<= (overlay-start ov) (point))
                            (>= (overlay-end ov) (point)))
                           return ov)))
             (when ov
               (delete-overlay ov)))
           (setq org-latex-fragment-last el))))))


(add-hook 'post-command-hook 'org-latex-fragment-toggle)

;;replace selected text by default
(delete-selection-mode 1)

;;always show line numbers
(global-linum-mode)

;;prevent creating lockfiles
(setq create-lockfiles nil)

;; stop creating those #auto-save# files
(setq auto-save-default nil)

(put 'shell-resync-dirs 'disabled nil)

;highlight current line
(setq hl-line-sticky-flag nil)
(global-hl-line-mode 0)
(set-face-background hl-line-face "orange" )

;; Make sure we can find coqtop
(setq exec-path (append exec-path '("/usr/local/bin")))

(custom-set-variables '(coq-prog-name "/opt/homebrew/bin/coqtop") '(proof-three-window-enable t))

(global-prettify-symbols-mode 1)

(setq coq-symbols-list '(lambda ()
        (mapc (lambda (pair) (push pair prettify-symbols-alist))
            '(("forall". ?∀)
              ("exists". ?∃)
              ("~" . ?¬)
              ("/\\" . ?⋀)
              ("\\/" . ?⋁)
              ("=>". ?⇒)
              ("->". ?→)
              ("<-" . ?←)
              ("<->" . ?↔)
              ("nat" . ?ℕ)
              ("*" . ?×)))))

;; Prettify Coq script editor

(add-hook 'coq-mode-hook coq-symbols-list)

;; Prettify Coq output in proofs
(add-hook 'coq-goals-mode-hook coq-symbols-list)

(require 'tex-site)
(add-hook 'TeX-mode-hook
    (lambda ()
        (add-to-list 'TeX-output-view-style
            '("^pdf$" "."
              "/Applications/Skim.app/Contents/SharedSupport/displayline %n %o %b")))
    )

(put 'iconify-or-deiconify-frame 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
