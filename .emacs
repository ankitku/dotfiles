
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Make use of refTeX in org-mode
(defun org-mode-reftex-setup ()
(load-library "reftex")
(and (buffer-file-name)
(file-exists-p (buffer-file-name))
(reftex-parse-all))
(define-key org-mode-map (kbd "C-c )") 'reftex-citation)
)
(add-hook 'org-mode-hook 'org-mode-reftex-setup)

;; Set LaTeXmk the default LaTeX compiler
;;(setq org-latex-to-pdf-process (list "latexmk -f -pdf %s"))

;;(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "LaTeXmk")))

;; Enable LaTeX-math-mode by default
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(setenv "PATH" (concat "/Library/TeX/texbin:" (getenv "PATH")))

(load-file (let ((coding-system-for-read 'utf-8))
             (shell-command-to-string "agda-mode locate")))
