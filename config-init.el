;;; Set package.el
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/") 
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(defun find-in (dir regexp)
  (concat dir 
	  (car (let ((default-directory dir))
		 (file-expand-wildcards regexp)))))

(add-to-list 'load-path (find-in "~/.emacs.d/elpa/" "dired+*"))
(add-to-list 'load-path (find-in "~/.emacs.d/elpa/" "w32-browser*"))
(require 'package)
(require 'dired+)
(require 'w32-browser)
(package-initialize)


;;; Install packages if not yet installed
(when (not package-archive-contents)
  (package-refresh-contents))
(defvar my-packages '(smex color-theme-solarized clojure-mode nrepl paredit))
(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

(setq temp-dir "~/.emacs.d/temp")
(setq backup-directory-alist
          `((".*" . ,temp-dir)))
    (setq auto-save-file-name-transforms
          `((".*" ,temp-dir t)))

;;; Disable startup messages
(setq inhibit-startup-message t)

;;; Set ido and smex
(ido-mode t)
(require 'smex)
(setq smex-save-file "~/.emacs.d/smex.save")
(smex-initialize)

;;; Visual customizations
(set-face-attribute 'default nil :height 100 :font "Consolas")
(load-theme 'solarized-dark t)
(tool-bar-mode -1)
(global-font-lock-mode 1)
(global-linum-mode t)

;;; Hooks
(add-hook 'clojure-mode-hook 'paredit-mode)

;;; Key bindings
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)



