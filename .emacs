(setenv "PATH" (concat "/usr/local/bin/:"(getenv "PATH")))

(setenv "PATH" (concat "/Library/TeX/texbin/:" (getenv "PATH")))
(setq LaTeX-command-style '(("" "%(PDF)%(latex) -file-line-error %S%(PDFout)")))

(add-hook 'haskell-mode-hook #'hindent-mode)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(put 'downcase-region 'disabled nil)

(setq exec-path (append  exec-path '("/Users/ankitku/.cabal/bin")))
(setq exec-path (append  exec-path '("/Users/ankitku/Applications/ghc-7.10.1.app/Contents/bin")))
(setq exec-path (append  exec-path '("/Users/ankitku/.opam/system/bin")))

(setenv "PATH" (concat "/Users/ankitku/.cabal/bin/:"(getenv "PATH")))
(setenv "PATH" (concat "/Library/Frameworks/GHC.framework/Versions/8.0.1-x86_64/usr/bin/:" (getenv "PATH")))
(setenv "PATH" (concat "/Library/Frameworks/GHC.framework/Versions/8.0.1-x86_64/usr/bin/:" (getenv "PATH")))
(setenv "PATH" (concat "/Users/ankitku/.local/bin/:" (getenv "PATH")))
(setenv "PATH" (concat "/Users/ankitku/dev/PG/generic/:" (getenv "PATH")))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Open .v files with Proof General's Coq mode
;;(load "~/.emacs.d/lisp/PG/generic/proof-site")

;; Load company-coq when opening Coq files
;;(company-coq-mode)

(load "~/dev/PG/generic/proof-site")

(defconst proof-site-file
  (expand-file-name "/Users/ankitku/dev/PG/generic/proof-site.el"))
(defconst lprolog-file
  (expand-file-name "/Users/ankitku/dev/PG/abella/lprolog.el"))

(defmacro delete-mappings (alist key)
  `(while (assoc ,key ,alist)
     (setq ,alist (delq (assoc ,key ,alist) ,alist))))

(when (file-exists-p proof-site-file)
  (delete-mappings auto-mode-alist "\\.thm\\'")
  (setq proof-splash-enable nil)
  (setq proof-three-window-enable nil)
  (setq proof-three-window-mode-policy 'horizontal)
  (setq proof-output-tooltips nil)
  (load-file proof-site-file))

(when (file-exists-p lprolog-file)
  (autoload 'lprolog-mode lprolog-file "Major mode for Lambda Prolog" t)
  (delete-mappings auto-mode-alist "\\.mod\\'")
  (add-to-list 'auto-mode-alist '("\\.mod\\'" . lprolog-mode))
  (add-to-list 'auto-mode-alist '("\\.sig\\'" . lprolog-mode)))

(require 'proof-site)
