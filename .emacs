
;; headers
(load "/home/gary/.xemacs/std_comments.el")

;; mode JS2
(setq load-path (append (list (expand-file-name "~/.xemacs/js2")) load-path))
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; mode ExtJS
(load "/home/gary/.xemacs/extjs.el")

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
