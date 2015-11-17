(let* ((cygwin-root "c:/cygwin64")
       (cygwin-bin (concat cygwin-root "/bin")))
  (when (and (eq 'windows-nt system-type)
	     (file-readable-p cygwin-root))
  
    (setq exec-path (cons cygwin-bin exec-path))
    (setenv "PATH" (concat cygwin-bin ";" (getenv "PATH")))
  
    ;; By default use the Windows HOME.
    ;; Otherwise, uncomment below to set a HOME
    ;;      (setenv "HOME" (concat cygwin-root "/home/eric"))
  
    ;; NT-emacs assumes a Windows shell. Change to bash.
    (setq shell-file-name "zsh")
    (setenv "SHELL" shell-file-name) 
    (setq explicit-shell-file-name shell-file-name) 

    ;; This removes unsightly ^M characters that would otherwise
    ;; appear in the output of java applications.
    (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)))

(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/")
      package-archives )
(push '("melpa" . "http://melpa.milkbox.net/packages/")
      package-archives)
(package-initialize) 
  
  
; Enable Evil package
(require 'evil)
(evil-mode 1)
(custom-set-variables)

; Use Material theme
(load-theme 'material t)

; Change color of the Vim-like cursor
(setq evil-default-cursor t)

;; Use 10-pt Consolas as default font
(set-face-attribute 'default nil
                    :family "Consolas" :height 110)
