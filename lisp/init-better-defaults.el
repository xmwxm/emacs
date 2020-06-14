;; init-better-defaults.el 增强内置功能

;; auto-reconver
(global-auto-revert-mode t)

(setq auto-save-default nil)



;; 禁止自动生成备份文件
(setq make-backup-files nil)

(setq auto-save-default nil)


;; 最近打开的10个文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)


;; 即当你选中一段文字之后输入一个字符会替换掉你选中部分的文字。
(delete-selection-mode 1)



(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)



(setq ring-bell-function 'ignore)


;; 显示行号 高亮光标行
(global-linum-mode 1)


;; config for company 长变量短别名
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; sigature
					    ("xmw" "xiemaowei")
					    ;; emacs regex
					    ))



(fset 'yes-or-no- 'y-or-n-p)


(provide 'init-better-defaults)
