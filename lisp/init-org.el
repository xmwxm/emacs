;; init-org.el Org 模式相关的全部设定



;; 打开org文本也可以正常显示“注释”的内容
;; 添加Org-mode文本内语法高亮

(require 'org)
(setq org-src-fontify-natively t)


;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/.emacs.d/org"))






(provide 'init-org)
