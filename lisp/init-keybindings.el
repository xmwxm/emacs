;; init-keybindings.el 快捷键绑定


;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; 绑定快捷键 f2
(global-set-key (kbd "<f2>") 'open-init-file)


;; 这个快捷键绑定可以用之后的插件 counsel 代替
(global-set-key "\C-x\ \C-r" 'recentf-open-files)



;; 三个自定义查找函数、变量、绑定的快捷键
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


;; 设置 org-agenda 打开快捷键

(global-set-key (kbd "C-c a") 'org-agenda)


(global-set-key (kbd "C-c p f") 'counsel-git)

;; 设置代码缩进
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)







(provide 'init-keybindings)
