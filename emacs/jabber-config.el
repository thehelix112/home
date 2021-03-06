;; Docs: http://emacs-jabber.sourceforge.net/manual-0.8.0/
;; 
;; Notes:
;;     There are a bunch of other configuration options than what's
;;     in here.
;; 
;; Tips:
;;     C-x C-j C-c = Connect to all jabber accounts
;;     C-x C-j C-j = Start a private chat
;;     C-x C-j C-l = Switch to buffer with latest activity
;;     C-x C-j C-r = Switch to the roster buffer

;; --------------------------------------------------------------------------
;; INCLUDE
;; --------------------------------------------------------------------------

;; Uncomment the following line and replace the path with wherever
;; you put emacs-jabber.
;(add-to-list 'load-path "/path/to/emacs-jabber")
(require 'jabber-autoloads)

;; --------------------------------------------------------------------------
;; CONFIG
;; --------------------------------------------------------------------------

;; ~ Key Bindings

(global-set-key (kbd "M-a") 'jabber-activity-switch-to)

(global-set-key (kbd "ESC 1") 'jabber-buffer-1)
(global-set-key (kbd "ESC 2") 'jabber-buffer-2)
(global-set-key (kbd "ESC 3") 'jabber-buffer-3)
(global-set-key (kbd "ESC 4") 'jabber-buffer-4)
(global-set-key (kbd "ESC 5") 'jabber-buffer-5)
(global-set-key (kbd "ESC 6") 'jabber-buffer-6)
(global-set-key (kbd "ESC 7") 'jabber-buffer-7)
(global-set-key (kbd "ESC 8") 'jabber-buffer-8)
(global-set-key (kbd "ESC 9") 'jabber-buffer-9)

(global-set-key (kbd "C-x C-j C-n") 'jabber-muc-names)

;; ~ Accounts

;; This is your account list. It's probably going to be just the on account.
(setq jabber-account-list '(("dandrews@talk.neuraliq.com/emacs"
							 (:network-server  . "talk.dev.neuraliq.com")
							 (:port            . 5223)
							 (:connection-type . ssl))))

;; This is used in my-jabber-autojoin.
(setq my-jabber-nickname "thehelix")

;; ~ Buffer formats

;; The format for private chat buffer names
;;    %d   The group JID or nickname
;;    %n   The username nickname
;;    %r   The user 
(setq jabber-chat-buffer-format "%n (pm)")

;; The format for groupchat buffer names
;;    %d   The group JID or nickname
;;    %g   The group name
(setq jabber-groupchat-buffer-format "#%g")

;; The format for groupchat private buffer names
;;    %d   The group JID or nickname
;;    %g   The group name
;;    %n   The user nickname
(setq jabber-groupchat-private-buffer-format "%n in #%g (pm)")

;; ~ Prompt strings

;; The prompt string for private chats (your prompt only)
;;    %t   Time, formatted according to jabber-chat-time-format
;;         or jabber-chat-delayed-time-format
;;    %u   Username
;;    %n   Nickname (obsolete, same as username)
;;    %r   Resource
;;    %j   Bare JID (without resource)
(setq jabber-chat-local-prompt-format "[%t] %n> ")

;; The prompt string for private chats (for the other user's prompt only)
;;    %t   Time, formatted according to jabber-chat-time-format
;;         or jabber-chat-delayed-time-format
;;    %n   Nickname, or JID if no nickname set
;;    %u   Username
;;    %r   Resource
;;    %j   Bare JID (without resource)
(setq jabber-chat-foreign-prompt-format "[%t] %u> ")

;; The prompt string for group chats (for everyone)
;;    %t   Time, formatted according to jabber-chat-time-format
;;    %n, %u, %r
;;         Nickname in groupchat
;;    %j   Full JID (room@server/nick)
(setq jabber-groupchat-prompt-format "[%t] %n> ")

;; Makes jabber NOT break lines up at 80 chars
(setq jabber-chat-fill-long-lines nil)

;; Makes emacs do automatic word-wrapping in windows
(setq truncate-partial-width-windows nil)

;; Default: "%H:%M"
;; Valid values: http://www.delorie.com/gnu/docs/elisp-manual-21/elisp_689.html
(setq jabber-chat-time-format "%H:%M:%S")

;; List of rooms to join when my-jabber-autojoin is called.
;; Set this list to whatever you want. You can just comment
;; out the ones you don't want to automatically connect to.
(setq my-jabber-rooms '(
  "db"
  "dev"
  "leads"
  "middleware"
  "neuraliq"
  "neuralui"
  "qa"
  "segway"
  "sentinel"
  "sigeng"
  "standup"
  "sys"
  "web"
))

;; This will map "M-#" to the buffer you specify. These buffers
;; can be _any_ buffer, like rooms (seen below), private chats
;; (in the form "nick (pm)", the *scratch* buffer, etc.
(setq my-jabber-numbered-buffers '(
  :1 "#dev"
  :2 "#neuraliq"
  :3 "#sigeng"
  :4 "#sentinel"
  :5 "#neuralui"
  :6 "#segway"
  :7 "#qa"
  :8 "#sys"
  :9 "#standup"
))

;; This is the hostname used for groups (for my-jabber-autojoin).
(setq hostname-for-groups "conference.talk.neuraliq.com")

;; If t then growl will alert you for all private chat activity.
;; If you don't want this, set it to nil.
(setq growl-for-private-messages nil)

;; If t then growl will alert you for all groupchat chat activity.
;; If you don't want this, set it to nil.
(setq growl-for-groupchat-messages nil)

;; If t (arrange/jabber) will be called after jabber connects.
(setq my-jabber-auto-arrange-windows nil)

;; This is your default arrangement of windows. Any time `arrange/jabber'
;; is called the windows will be setup in this order (as a tree of
;; horizontal and vertical boxes). If `my-jabber-auto-arrange-windows'
;; is t then `arrange/jabber' will automatically get called after jabber
;; connects to your account.
(setq my-jabber-arrangement
  '(:hbox
	(:vbox
	 (:window "#segway")
	 (:window "#standup"))
	(:window "#neuraliq"))
  )

;; --------------------------------------------------------------------------
;; NUMBERED BUFFERS
;; --------------------------------------------------------------------------

(defmacro make-numbered-buffer-function (number)
  (let* ((number        (number-to-string number))
		 (function-name (intern (concat "jabber-buffer-" number)))
		 (keyword       (intern (concat ":" number))))
	`(defun ,function-name ()
	   (interactive)
	   (let ((buffer (getf my-jabber-numbered-buffers ,keyword)))
		 (when buffer
		   (set-window-buffer (selected-window) (get-buffer-create buffer)))))))

(make-numbered-buffer-function 1)
(make-numbered-buffer-function 2)
(make-numbered-buffer-function 3)
(make-numbered-buffer-function 4)
(make-numbered-buffer-function 5)
(make-numbered-buffer-function 6)
(make-numbered-buffer-function 7)
(make-numbered-buffer-function 8)
(make-numbered-buffer-function 9)

;; --------------------------------------------------------------------------
;; AFTER CONNECTING
;; --------------------------------------------------------------------------

(defun arrange/jabber ()
  "Calling this function sets up the windows in a certain arrangement
and initializes each window with its corresponding buffer."
  (interactive)
  (when my-jabber-arrangement
	(arrange my-jabber-arrangement)))

(when my-jabber-auto-arrange-windows
  (add-hook 'jabber-post-connect-hooks #'arrange/jabber))

;; --------------------------------------------------------------------------
;; GROWL
;; --------------------------------------------------------------------------

;; For private messages
(when growl-for-private-messages
  (add-hook 'jabber-message-hooks
	(lambda (from buffer text proposed-alert)
	  (growl (concat (get-bare-name from) ": " text)))))

;; For new activity in a group chat
(when growl-for-groupchat-messages
  (remove-hook 'jabber-muc-hooks
    (lambda (nick group buffer text proposed-alert)
	  (growl (concat "Activity in room #" (get-bare-name group) ": " text)))))

;; --------------------------------------------------------------------------
;; GROUP CHAT
;; --------------------------------------------------------------------------

(defun niq-groupchat-jid (room)
  (concat room "@" hostname-for-groups))

;; This adds "@,hostname-for-groups" to the end of each room name
(setq my-jabber-rooms (mapcar #'niq-groupchat-jid my-jabber-rooms))

;; M-x my-jabber-autojoin
;; Call this to join all the rooms specified in my-jabber-rooms
(defun my-jabber-autojoin ()
  (interactive)
  (let ((jc (jabber-read-account))
		(jabber-muc-disable-disco-check t))
	(dolist (room my-jabber-rooms)
	  (message (concat "Joining room '" room "'"))
	  (jabber-groupchat-join jc room my-jabber-nickname t))))

;; --------------------------------------------------------------------------
;; BUFFER NAME FORMATTERS
;; --------------------------------------------------------------------------

(defun get-bare-name (jid)
  (replace-regexp-in-string "@.*" "" jid))

(eval-after-load "jabber"
  '(progn
	 ;; Buffer format for private chats
	 (defun jabber-chat-get-buffer (chat-with)
	   (format-spec jabber-chat-buffer-format
		 (list
		  (cons ?d (jabber-jid-displayname chat-with))
		  (cons ?n (get-bare-name chat-with))
		  (cons ?r (or (jabber-jid-resource chat-with) "")))))
	 ;; Buffer format for group chats
	 (defun jabber-muc-get-buffer (group)
	   (format-spec jabber-groupchat-buffer-format
	     (list
		  (cons ?d (jabber-jid-displayname group))
		  (cons ?g (get-bare-name group)))))
	 ;; Buffer format for private chats in a groupchat
	 (defun jabber-muc-private-get-buffer (group nickname)
	   (format-spec jabber-groupchat-private-buffer-format
		 (list
		  (cons ?d (jabber-jid-displayname group))
		  (cons ?g (get-bare-name group))
		  (cons ?n nickname))))))
