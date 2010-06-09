;;
;; extjs.el for mode ExtJS in /home/goldledoigt/.xemacs
;; 
;; Made by goldledoigt
;; Contact   <goldledoigt@chewam.com>
;; 
;; Started on  Thu Oct 15 23:09:04 2009 goldledoigt
;; Last update Mon May 31 19:12:50 2010 Gary van Woerkens
;;

(global-set-key "\C-cc" 'ext-insert-console)
(global-set-key "\C-ce" 'ext-insert-methode)
(global-set-key "\C-cr" 'ext-insert-onready)
(global-set-key "\C-ct" 'ext-insert-extension)
(global-set-key "\C-cw" 'ext-insert-window)
(global-set-key "\C-cm" 'ext-insert-messagebox)

(defun ext-insert-console ()
  (interactive)
  (insert-string "console.log('', this, arguments);")
)

(defun ext-insert-methode ()
  (interactive)
  (setq methodename
	(read-from-minibuffer
	 (format "methode name (RETURN to quit) : ")))
  (insert-string (concat "," methodename ":function() {"))
  (newline)
  (newline)
  (insert-string "}")
  (newline)
)

(defun ext-insert-onready ()
  (interactive)
  (insert-string "Ext.onReady(function() {")
  (newline)
  (newline)
  (insert-string "});")
  (newline)
)

(defun ext-insert-extension ()
  (interactive)
  (setq extname
	(read-from-minibuffer
	 (format "extension name: ")))
  (setq extspace
	(read-from-minibuffer
	 (format "namespace: ")))
  (setq extended
	(read-from-minibuffer
	 (format "extended: ")))
  (setq xtype
	(read-from-minibuffer
	 (format "xtype: ")))
  (insert-string (concat "Ext.ns('" extspace "');"))
  (newline)
  (newline)
  (insert-string (concat extspace "." extname " = Ext.extend(" extended ", {"))
  (newline)
  (newline)
  (insert-string (concat "\t" "initComponent:function() {"))
  (newline)
  (newline)
  (insert-string (concat "\t\t" extspace "." extname ".superclass.initComponent.call(this);"))
  (newline)
  (newline)
  (insert-string "\t}")
  (newline)
  (newline)
  (insert-string "});")
  (newline)
  (newline)
  (insert-string (concat "Ext.reg('" xtype "', " extspace "." extname ");"))
  (newline)
)

(defun ext-insert-window ()
  (interactive)
  (insert-string "var win = new Ext.Window({")
  (newline)
  (insert-string "\twidth:300")
  (newline)
  (insert-string "\t,height:300")
  (newline)
  (newline)
  (insert-string "});")
  (newline)
)

(defun ext-insert-messagebox ()
  (interactive)
  (setq msgicon "INFO")
  (setq msgbuttons "OK")
  (setq msgtype
	(read-from-minibuffer
	 (format "message type (info|question|warning|error): ")))
  (when (equal msgtype "info") (setq msgicon "INFO") (setq msgbuttons "OK"))
  (when (equal msgtype "question") (setq msgicon "QUESTION") (setq msgbuttons "YESCANCEL"))
  (when (equal msgtype "warning") (setq msgicon "WARNING") (setq msgbuttons "OK"))
  (when (equal msgtype "error") (setq msgicon "ERROR") (setq msgbuttons "OK"))
  (insert-string "Ext.MessageBox.show({")
  (newline)
  (insert-string (concat "\ttitle:\"" msgtype "\""))
  (newline)
  (insert-string "\t,msg:\"\"")
  (newline)
  (insert-string (concat "\t,buttons:Ext.MessageBox." msgbuttons))
  (newline)
  (insert-string (concat "\t,icon:Ext.MessageBox." msgicon))
  (newline)
  (insert-string "\t,fn:")
  (newline)
  (newline)
  (insert-string "});")
  (newline)
)
