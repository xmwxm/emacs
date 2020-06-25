;; init-ui.el 视觉层配置


;; 关闭工具栏，tool-bar-mode 是一个Monir Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)


(global-hl-line-mode t)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 更改显示字体大小 13pt
(set-face-attribute 'default nil :height 130)

;; 设置光标样式
(setq-default cursor-type 'bar)


(setq initial-frame-alist (quote ((fullscreen . maximized))))

(provide 'init-ui)
