;; init-org.el Org 模式相关的全部设定



;; 打开org文本也可以正常显示“注释”的内容
;; 添加Org-mode文本内语法高亮

(require 'org)
(setq org-src-fontify-natively t)


;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/.emacs.d "))


(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
	 "* TODO [#B] %?\n  %i\n"
	 :empty-lines 1))) 

;; r aka remember
(global-set-key (kbd "C-c r") 'org-capture)





(provide 'init-org)
