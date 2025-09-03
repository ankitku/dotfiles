
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

(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages"))
(require 'package)

;; Add melpa package source when using package list
;; Package.el stuff
(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")))

(package-initialize)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/themes"))

;;magit
(global-set-key (kbd "C-x g") 'magit-status)

;;windmove
(windmove-default-keybindings)


(setq package-check-signature nil)


;;acl2s keybindings
(load "~/dev/.emacs-acl2.el")
;(load "~/dev/send-form.lisp")

(load "~/dev/scripts/.lisp.el")
(put 'match 'lisp-indent-function 'defun)

;; (setq telephone-line-subseparator-faces '())
;; (setq telephone-line-height 20
;;       telephone-line-evil-use-short-tag t)
;; (telephone-line-mode t)

;;user agent to connect to melpa
(require 'url-http)
(defun url-http-user-agent-string ()
  "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.80 Safari/537.36
")
(setq url-mime-charset-string "en-US,en;q=0.8")
(setq url-mime-encoding-string "gzip, deflate, sdch")


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

;;Font
(set-face-attribute 'default nil :font "Space Mono" :height 120 :weight 'normal)

(when (window-system)
  (set-frame-font "Fira Code-12" nil t)
  (let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
                 (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
                 (36 . ".\\(?:>\\)")
                 (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
                 (38 . ".\\(?:&&\\)")
                 (42 . ".\\(?:\\(?:\\*\\*\\)\\|[*>]\\)")
                 (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
                 (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
                 ;; (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
                 (47 . ".\\(?:\\(?:/\\*\\|//\\)\\|[*/=>]\\)")
                 (48 . ".\\(?:x[a-zA-Z]\\)")
                 (58 . ".\\(?:::\\|[:=]\\)")
                 (59 . ".\\(?:;;\\|;\\)")
                 (60 . ".\\(?:\\(?:<<\\|[<=]\\)\\|[<=]\\)")
                 (61 . ".\\(?:\\(?:==\\|[=>]\\)\\|[=>]\\)")
                 (62 . ".\\(?:\\(?:>>\\|[=>]\\)\\|[=>]\\)")
                 (63 . ".\\(?:\\(?:\\?\\?\\)\\|[:?]\\)")
                 (91 . ".\\(?:]\\)")
                 (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|[\\]})\\)")
                 (94 . ".\\(?:=\\)")
                 (119 . ".\\(?:ww\\)")
                 (123 . ".\\(?:-\\)")
                 (124 . ".\\(?:\\(?:|\\|[|=]\\)\\|[|]\\)")
                 (126 . ".\\(?:~>\\|~\\)")
                 )
               ))
    (dolist (char-regexp alist)
      (set-char-table-range composition-function-table (car char-regexp)
                            (nconc (char-table-range composition-function-table (car char-regexp))
                                   (list (vector (cdr char-regexp) 0 'compose-gstring-for-graphic)))))))


;; Enable anti-aliasing on macOS
(when (eq system-type 'darwin)
  (setq mac-allow-anti-aliasing t))

;; (use-package default-text-scale
;;   :ensure t
;;   :config
;;   (default-text-scale-mode))

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
 '(coq-prog-name "/opt/homebrew/bin/coqtop")
 '(custom-enabled-themes '(autumn-light))
 '(custom-safe-themes
   '("7189211b12d8bcba23677bb5bf45b7585cf00cf97db246ed83e14a90ef88405c"
     "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6"
     "377bf88f6a5c5085bccdd96beeade170a55df7944e9768f1108ada15d4e71e02"
     "0b2e94037dbb1ff45cc3cd89a07901eeed93849524b574fa8daa79901b2bfdcf"
     default))
 '(package-selected-packages
   '(alect-themes auctex-latexmk auto-complete-auctex autumn-light-theme
		  company-math default-text-scale git-commit go-mode
		  highlight-defined load-theme-buffer-local magit
		  mode-line-bell modus-themes telephone-line
		  use-package-hydra vterm xkcd))
 '(proof-three-window-enable t))
(setq tron-legacy-theme-vivid-cursor t)
(setq-default cursor-type 'bar) 
(setq tron-legacy-theme-softer-bg t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
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
(add-hook 'TeX-mode-hook #'rainbow-delimiters-mode)

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

;; Replace selected text by default
(delete-selection-mode 1)

;; Prevent creating lockfiles
(setq create-lockfiles nil)

;; Stop creating those #auto-save# files
(setq auto-save-default nil)

(put 'shell-resync-dirs 'disabled nil)

;highlight current line
(setq hl-line-sticky-flag nil)
(global-hl-line-mode 0)
(set-face-background hl-line-face "orange" )

;; Make sure we can find coqtop
(setq exec-path (append exec-path '("/usr/local/bin")))

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

;;(require 'tex-site)
(add-hook 'TeX-mode-hook
    (lambda ()
        (add-to-list 'TeX-output-view-style
            '("^pdf$" "."
              "/Applications/Skim.app/Contents/SharedSupport/displayline %n %o %b")))
    )

(put 'iconify-or-deiconify-frame 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'set-goal-column 'disabled nil)

(require 'go-mode)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;; reload this file
(defun reload-emacs ()
  (interactive)
  (load "~/.emacs"))
(global-set-key (kbd "C-c r") 'reload-emacs)
