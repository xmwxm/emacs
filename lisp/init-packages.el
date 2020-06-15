;; init-packages.el 插件管理

(when (>= emacs-major-version 24)
;;  (require 'package)
;;  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
		      ;; --- Auto-completion ---
		      company
		      ;; --- Better Editor ---
		      hungry-delete
		      ;; --- Auto-company
		      swiper
		      counsel
		      smartparens
		      ;; --- Major Mode ---
		      js2-mode
		      ;; --- Minor Mode ---
		      nodejs-repl
		      exec-path-from-shell
		      ;; --- Themes ---
		      monokai-theme
		      ;; solarized-theme
		      popwin
		      ;; MacOS
		      reveal-in-osx-finder
		      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;; 开启全局 Company 补全
;; M-n M-p 进行选择备选
;; 1 和 t效果都是一样的
(global-company-mode 1)



;; load-theme
(load-theme 'monokai t)

;; config for hungry-delete

(require 'hungry-delete)
(global-hungry-delete-mode t)

(global-auto-revert-mode t)

;; config for popwin 光标自动到新窗口
(require 'popwin)
(popwin-mode t)

;; autoload属性 宏定义



;; config for swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)



;; config for smartparens
;;(require 'smartparens-config)
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)


;; config for js-mode

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))





;; M-x nodejs-repl
;; nodejs-repl-send-buffer 

(require 'nodejs-repl)



(provide 'init-packages)
