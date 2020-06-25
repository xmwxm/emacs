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





(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))
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

(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))



 (setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))




(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)




(put 'dired-find-alternate-file 'disabled nil)


(require 'dired-x)

(setq dired-dwim-target t)



;; config for auto-remove-html-'^M
(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))

(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))


;; dwim : do what i mean
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwim)

(set-language-environment "UTF-8")



(defun YOUR_NAME/retrieve-chrome-current-tab-url()
  (interactive)
  (insert (my/retrieve-chrome-current-tab-url)))

(defun YOUR_NAME/retrieve-chrome-current-tab-url()
  "Get the URL of the active tab of the first window"
  (interactive)
      (let ((result (do-applescript
		     (concat
		      "set frontmostApplication to path to frontmost application\n"
		      "tell application \"Google Chrome\"\n"
		      " set theUrl to get URL of active tab of first window\n"
		      " set theResult to (get theUrl) \n"
		      "end tell\n"
		      "activate application (frontmostApplication as text)\n"
		      "set links to {}\n"
		      "copy theResult to the end of links\n"
		      "return links as string\n"))))
	(format "%s" (s-chop-suffix "\"" (s-chop-prefix "\"" result)))))


(provide 'init-better-defaults)

