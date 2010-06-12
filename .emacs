;; set comments font color
(set-face-foreground 'font-lock-comment-face "red")
(set-face-foreground 'font-lock-comment-delimiter-face "red")

;; headers
(load "~/.xemacs/std_comments.el")

;; mode JS2
(setq load-path (append (list (expand-file-name "~/.xemacs/js2")) load-path))
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; mode PHP
(load "~/.xemacs/php-mode.el")

;; mode ExtJS
(load "~/.xemacs/extjs.el")

;; mode CSS
 (load "~/.xemacs/css-mode.el")
 (autoload 'css-mode "css-mode")
 (setq auto-mode-alist       
       (cons '("\\.css\\'" . css-mode) auto-mode-alist))

;; bind query-replace key for Mac OS X
(global-set-key (kbd "<f5>") 'query-replace)

;; dont show the GNU splash screen
(setq inhibit-startup-message t)

;; debug
(setq debug-on-error t)

;;=============================================================================
;;          All the backups go to the same directory
;;=============================================================================
(setq backup-directory (expand-file-name "~/.emacs.backups"))
(setq directory-sep-char ?/)

(defun make-backup-file-name (file)
  (let ((fname (concat
                   (file-name-nondirectory file)
                      ", "
                         (subst-char-in-string ?: ?!
                                               (subst-char-in-string ? ?!
                       (subst-char-in-string directory-sep-char ?!
                         (file-name-directory file)))))))
    (concat backup-directory "/"
     (substring fname 0 (min (length fname) 80)))))


;; indentation for PHP-MODE
(defun clean-php-mode ()
(interactive)
(php-mode)
(setq c-basic-offset 2) ; 2 tabs indenting
(setq indent-tabs-mode nil)
(setq fill-column 78)
(c-set-offset 'case-label '+)
(c-set-offset 'arglist-close 'c-lineup-arglist-operators))
(c-set-offset 'arglist-intro '+) ; for FAPI arrays and DBTNG
(c-set-offset 'arglist-cont-nonempty 'c-lineup-math) ; for DBTNG fields and values