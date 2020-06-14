;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
 
(require 'init-packages)

(require 'init-ui)

(require 'init-better-defaults)

(require 'init-org)

(require 'init-keybindings)

;; (require 'custom)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)

;; 重新读取init.el
;; M-x eval-buffer M:option C:control
;; custom for packages
;; M-x customize-group











 


