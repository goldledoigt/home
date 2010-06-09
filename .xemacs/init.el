;;=============================================================================
;;                     Colors in edit mode
;;=============================================================================
(global-font-lock-mode 1)

;;=============================================================================
;;                      Smooth scrolling
;=============================================================================
(setq scroll-step 2)

;;=============================================================================
;;                            Modes
;;=============================================================================
;(add-to-list 'load-path "/home/drppro02/emacsconf")
;; php mode
(autoload 'php-mode "php-mode" "PHP editing mode" t)
(add-to-list 'auto-mode-alist '(".php$" . php-mode))
(add-to-list 'auto-mode-alist '(".php3$" . php-mode))
(add-to-list 'auto-mode-alist '(".php4$" . php-mode))
(add-to-list 'auto-mode-alist '(".inc$" . php-mode))
(add-to-list 'auto-mode-alist '(".html$" . php-mode))
;; python mode
(autoload 'python-mode "python-mode" "Python editing mode" t)
(setq auto-mode-alist (cons '(".py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode) interpreter-mode-alist))
;; html helper mode
;;(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
;;(setq auto-mode-alist (cons '(".html$" . html-helper-mode) auto-mode-alist))
;;(setq html-helper-build-new-buffer t) ;; Inserts skeleton
;; javascript mode
(setq c-basic-offset 4)
(setq auto-mode-alist (append '(("\\.js$" . c-mode)) auto-mode-alist))

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

;;=============================================================================
;;                      Key F9 to compile
;;=============================================================================
;;(global-set-key [f9] `compile)

;;=============================================================================
;;                    scroll on  mouse wheel
;;=============================================================================
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)

(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)

(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)



;;#########################################################################
;;#########################################################################

;; css mode
(autoload 'css-mode "css-mode")
(setq auto-mode-alist       
      (cons '("\\.css\\'" . css-mode) auto-mode-alist))


;;#########################################################################
;;#########################################################################

;; XSL mode
(autoload 'xsl-mode "xslide" "Major mode for XSL stylesheets." t)

;; Uncomment if you want to use `xsl-grep' outside of XSL files.
;(autoload 'xsl-grep "xslide" "Grep for PATTERN in files matching FILESPEC." t)

;; Uncomment if you want to use `xslide-process' in `xml-mode'.
;(autoload 'xsl-process "xslide-process" "Process an XSL stylesheet." t)
;(add-hook 'xml-mode-hook
;         (lambda ()
;           (define-key xml-mode-map [(control c) (meta control p)]
;             'xsl-process)))

;; Turn on font lock when in XSL mode
(add-hook 'xsl-mode-hook
          'turn-on-font-lock)

(setq auto-mode-alist
      (append
       (list
        '("\\.fo" . xsl-mode)
        '("\\.xsl" . xsl-mode))
       auto-mode-alist))

;; Uncomment if using abbreviations
;(abbrev-mode t)

;; html mode
;;(autoload 'html-mode "html-mode" "HTML major mode." t)
;;(or (assoc "\\.html$" auto-mode-alist)
;;    (setq auto-mode-alist (cons '("\\.html$" . html-mode) 
;;				auto-mode-alist)))


; affichage des caractres "latins"
;(standard-display-european t)
;(set-terminal-coding-system 'iso-8859-15-unix)
;(set-keyboard-coding-system 'iso-8859-15-unix)
;(set-language-environment 'Latin-1)
