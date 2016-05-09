(setenv "PATH" (concat "/usr/local/bin/:"(getenv "PATH")))

(setenv "PATH" (concat "/Library/TeX/texbin/:" (getenv "PATH")))

(add-hook 'haskell-mode-hook #'hindent-mode)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

(put 'downcase-region 'disabled nil)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(setq exec-path (append  exec-path '("/Users/ankitku/.cabal/bin")))
(setq exec-path (append  exec-path '("/Users/ankitku/Applications/ghc-7.10.1.app/Contents/bin")))


(setenv "PATH" (concat "/Users/ankitku/.cabal/bin/:"(getenv "PATH")))
(setenv "PATH" (concat "/Users/ankitku/Applications/ghc-7.10.1.app/Contents/bin/:" (getenv "PATH")))
(setenv "PATH" (concat "/Users/ankitku/.cabal/share/x86_64-osx-ghc-7.10.1/Agda-2.5.1/emacs-mode" (getenv "PATH")))

(setenv "PATH" (concat "/Library/TeX/texbin/:" (getenv "PATH")))

(load-file (let ((coding-system-for-read 'utf-8))
	     (shell-command-to-string "agda-mode locate")))

;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/zombie-trellys-mode/")

;; load the packaged named xyz.
(load "zombie-trellys-mode") ;; best not to include the ending “.el” or “.elc”
