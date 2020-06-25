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




(global-set-key (kbd "s-/") 'hippie-expand)

;; C-x d : to open dired-mode
;; dired-mode for config 
;; + : to create directory
;; C-x C-f : to create file
;; g : to refresh dired buffer
;; C : to copy
;; R : rename file
;; d : delete file
;; u : undo
;; x : to do all

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))



(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))


(provide 'init-keybindings)
