 (add-to-list 'load-path "/usr/lib/xemacs/xemacs-packages/lisp/speedbar-0.14beta1")
 (add-to-list 'load-path "/usr/lib/xemacs/xemacs-packages/lisp/eieio-0.17beta1")
 (add-to-list 'load-path "/usr/lib/xemacs/xemacs-packages/lisp/eieio-0.17beta1")
 (add-to-list 'load-path "/usr/lib/xemacs/xemacs-packages/lisp/semantic-1.4beta7")

;; load nxml library
;;(add-to-list 'load-path (expand-file-name "/usr/share/emacs/site-lisp/nxml-mode/rng-auto.el"))
;;(load-library "nxml-mode")

;; load as3 library
;;(setq load-path (append load-path (list "/usr/share/emacs/site-lisp/actionscript-mode/")))
;;(load-library "actionscript-mode")
;;(require 'actionscript-mode)

;;
;(setq semantic-load-turn-everything-on t)
;(require 'semantic-load)

;;; Setup initial emacs frames (windows) location and size
(setq default-frame-alist
      '((wait-for-wm . nil)
        (top . 0) (left . 0)
        (width . 85) (height . 40)
        ))
(setq initial-frame-alist
      '((top . 0) (left . 2000)
        (width . 240) (height . 182)
        ))
(setq speedbar-frame-parameters '((minibuffer . nil)
                                  (width . 50)
                                  (border-width . 0)
                                  (menu-bar-lines . 0)
                                  (tool-bar-lines . 0)
                                  (unsplittable . t)
                                  (height . 80)
                                  (user-position . "yes")
                                  (left . 1050)))
;(speedbar-frame-mode)
(tool-bar-mode . nil)
(global-set-key [(meta g)] 'goto-line)

(defun browse-last-url ()
    (interactive)
    (save-excursion
        (re-search-backward thing-at-point-url-regexp)
        (browse-url-at-point)
    )
)
(global-set-key (kbd "C-c C-v") 'browse-last-url)

;;(require 'php-mode)

(add-to-list 'load-path "/home/dandrews/emacs")
;(require 'cmake-mode)
(require 'minimap)

(setq-default tab-width 8)
(setq-default indent-tabs-mode t)

(defun niq-cmake-hook ()
    (setq cmake-tab-width 8)
    (setq indent-tabs-mode nil)
)
(add-hook 'cmake-mode-hook 'niq-cmake-hook)
;(require 'id-utils)
 ;(autoload 'gid "id-utils")

(add-hook 'before-save-hook (lambda ()
  (delete-trailing-whitespace)
  (cond ((or (eq major-mode 'makefile-mode)
             (eq major-mode 'perl-mode))
         t) ; do nothing
        (t (untabify (point-min) (point-max))))))


(setq auto-mode-alist
      '(("\\.[Cc][Oo][Mm]\\'" . text-mode)
        ("\\.as\\'" . actionscript-mode)
        ("\\.bat\\'" . bat-generic-mode)
        ("\\.inf\\'" . inf-generic-mode)
        ("\\.rc\\'" . rc-generic-mode)
        ("\\.reg\\'" . reg-generic-mode)
        ("\\.cob\\'" . cobol-mode)
        ("\\.cbl\\'" . cobol-mode)
        ("\\.te?xt\\'" . text-mode)
        ("\\.proto\\'" . protobuf-mode)
        ("CMakeLists\\.txt\\'" . cmake-mode)
        ("\\.cmake\\'" . cmake-mode)
        ("\\.c\\'" . c++-mode)
        ("\\.h\\'" . c++-mode)
        ("\\.tex$" . LaTeX-mode)
        ("\\.sty$" . LaTeX-mode)
        ("\\.bbl$" . LaTeX-mode)
        ("\\.bib$" . BibTeX-mode)
        ("\\.el\\'" . emacs-lisp-mode)
        ("\\.scm\\'" . scheme-mode)
        ("\\.l\\'" . lisp-mode)
        ("\\.lisp\\'" . lisp-mode)
        ;;("\\.f\\'" . fortran-mode)
        ;;("\\.F\\'" . fortran-mode)
        ;;("\\.for\\'" . fortran-mode)
        ("\\.p\\'" . pascal-mode)
        ("\\.pas\\'" . pascal-mode)
        ("\\.ad[abs]\\'" . ada-mode)
        ("\\.\\([pP][Llm]\\|al\\)\\'" . perl-mode)
        ("\\.cgi$" . perl-mode)
        ("\\.s?html?\\'" . hm--html-mode)
        ("\\.phtml\\'" . hm--html-mode)
        ("\\.html\\'" . hm--html-mode)
        ("\\.htm\\'" . hm--html-mode)
        ("\\.idl\\'" . c++-mode)
        ("\\.cc\\'" . c++-mode)
        ("\\.hh\\'" . c++-mode)
        ("\\.hpp\\'" . c++-mode)
        ("\\.C\\'" . c++-mode)
        ("\\.H\\'" . c++-mode)
        ("\\.cpp\\'" . c++-mode)
        ("\\.[cC][xX][xX]\\'" . c++-mode)
        ("\\.hxx\\'" . c++-mode)
        ("\\.c\\+\\+\\'" . c++-mode)
        ("\\.h\\+\\+\\'" . c++-mode)
        ("\\.py\\'" . python-mode)
        ("\\.PY\\'" . python-mode)
        ("\\.php\\'" . php-mode)
        ("\\.php3\\'" . php-mode)
        ("\\.php4\\'" . php-mode)
        ("\\.php.inc\\'" . php-mode)
        ("\\.m\\'" . objc-mode)
        ("\\.java\\'" . java-mode)
        ("\\.js\\'" . js-mode)
        ("\\.json\\'" . js-mode)
        ("\\.ma?k\\'" . makefile-mode)
        ("\\(M\\|m\\|GNUm\\)akefile\\(\\.in\\)?" . makefile-mode)
        ("\\.am\\'" . makefile-mode)
        ("\\.mms\\'" . makefile-mode)
        ("\\.texinfo\\'" . texinfo-mode)
        ("\\.te?xi\\'" . texinfo-mode)
        ("\\.s\\'" . asm-mode)
        ("\\.sql\\'" . sql-mode)
        ("\\.S\\'" . asm-mode)
        ("\\.asm\\'" . asm-mode)
        ("ChangeLog\\'" . change-log-mode)
        ("change\\.log\\'" . change-log-mode)
        ("changelo\\'" . change-log-mode)
        ("ChangeLog\\.[0-9]+\\'" . change-log-mode)
        ("changelog\\'" . change-log-mode)
        ("changelog\\.[0-9]+\\'" . change-log-mode)
        ("\\$CHANGE_LOG\\$\\.TXT" . change-log-mode)
        ("\\.scm\\.[0-9]*\\'" . scheme-mode)
        ("\\.[ck]?sh\\'\\|\\.shar\\'\\|/\\.z?profile\\'" . sh-mode)
        ("\\(/\\|\\`\\)\\.\\(bash_profile\\|z?login\\|bash_login\\|z?logout\\)\\'" . sh-mode)
        ("\\(/\\|\\`\\)\\.\\(bash_logout\\|[kz]shrc\\|bashrc\\|t?cshrc\\|esrc\\)\\'" . sh-mode)
        ("\\(/\\|\\`\\)\\.\\([kz]shenv\\|xinitrc\\|startxrc\\|xsession\\)\\'" . sh-mode)
        ("\\.mm\\'" . nroff-mode)
        ("\\.me\\'" . nroff-mode)
        ("\\.ms\\'" . nroff-mode)
        ("\\.man\\'" . nroff-mode)
        ("\\.[12345678]\\'" . nroff-mode)
        ("\\.TeX\\'" . TeX-mode)
        ("\\.sty\\'" . LaTeX-mode)
        ("\\.cls\\'" . LaTeX-mode)
        ("\\.clo\\'" . LaTeX-mode)
        ("\\.bbl\\'" . LaTeX-mode)
        ("\\.bib\\'" . BibTeX-mode)
        ("\\.m4\\'" . m4-mode)
        ("\\.mc\\'" . m4-mode)
        ("\\.mf\\'" . metafont-mode)
        ("\\.mp\\'" . metapost-mode)
        ("\\.vhdl?\\'" . vhdl-mode)
        ("\\.article\\'" . text-mode)
        ("\\.letter\\'" . text-mode)
        ("\\.tcl\\'" . tcl-mode)
        ("\\.exp\\'" . tcl-mode)
        ("\\.itcl\\'" . tcl-mode)
        ("\\.itk\\'" . tcl-mode)
        ("\\.icn\\'" . icon-mode)
        ("\\.sim\\'" . simula-mode)
        ("\\.mss\\'" . scribe-mode)
        ;;("\\.f90\\'" . f90-mode)
        ("\\.lsp\\'" . lisp-mode)
        ("\\.awk\\'" . awk-mode)
        ("\\.prolog\\'" . prolog-mode)
        ("\\.tar\\'" . tar-mode)
        ("\\.\\(arc\\|zip\\|lzh\\|zoo\\|jar\\)\\'" . archive-mode)
        ("\\.\\(ARC\\|ZIP\\|LZH\\|ZOO\\|JAR\\)\\'" . archive-mode)
        ("\\`/tmp/Re" . text-mode)
        ("/Message[0-9]*\\'" . text-mode)
        ("/drafts/[0-9]+\\'" . mh-letter-mode)
        ("\\.zone\\'" . zone-mode)
        ("\\`/tmp/fol/" . text-mode)
        ("\\.y\\'" . c-mode)
        ("\\.lex\\'" . c-mode)
        ("\\.oak\\'" . scheme-mode)
        ("\\.sgml?\\'" . sgml-mode)
        ("\\.lbm\\'" . nxml-mode)
        ("\\.lae\\'" . nxml-mode)
        ("\\.xml\\'" . nxml-mode)
        ("\\.mxml\\'" . nxml-mode)
        ("\\.dtd\\'" . nxml-mode)
        ("\\.ds\\(ss\\)?l\\'" . dsssl-mode)
        ("\\.idl\\'" . c++-mode)
        ("[]>:/\\]\\..*emacs\\'" . emacs-lisp-mode)
        ("\\`\\..*emacs\\'" . emacs-lisp-mode)
        ("[:/]_emacs\\'" . emacs-lisp-mode)
        ("\\.l\\'" . flex-mode)
        ("\\.y\\'" . bison-mode)
        ("\\.yaml\\'" . yaml-mode)
        ("\\.ml\\'" . lisp-mode)))

(autoload 'speedbar' "speedbar" "load speedbar by default")
(autoload 'auto-revert-mode "autorevert" nil t)
(autoload 'turn-on-auto-revert-mode "autorevert" nil nil)
(autoload 'global-auto-revert-mode "autorevert" nil t)
(global-font-lock-mode 1)
(show-paren-mode 1)

;(add-hook 'font-lock-mode-hook 'turn-on-lazy-lock)

;;(add-hook 'php-mode-hook 'font-lock-mode)
(add-hook 'hm--html-mode-hook 'font-lock-mode)

(add-hook 'sgml-mode-hook 'nxml-mode)
(add-hook 'nxml-mode-hook 'turn-on-auto-revert-mode)
(add-hook 'nxml-mode-hook 'font-lock-mode)
(add-hook 'html-mode-hook 'turn-on-auto-revert-mode)
(add-hook 'html-mode-hook 'font-lock-mode)
(add-hook 'c-mode-hook 'turn-on-auto-revert-mode)
(add-hook 'c-mode-hook 'font-lock-mode)
(add-hook 'protobuf-mode-hook 'turn-on-auto-revert-mode)
(add-hook 'protobuf-mode-hook 'font-lock-mode)
(add-hook 'cmake-mode-hook 'turn-on-auto-revert-mode)
(add-hook 'cmake-mode-hook 'font-lock-mode)
(add-hook 'java-mode-hook 'turn-on-auto-revert-mode)
(add-hook 'java-mode-hook 'font-lock-mode)
(add-hook 'c++-mode-hook 'turn-on-auto-revert-mode)
(add-hook 'c++-mode-hook 'font-lock-mode)
;;(add-hook 'php-mode-hook 'turn-on-auto-revert-mode)
;;(add-hook 'php-mode-hook 'font-lock-mode)
;(add-hook 'LaTeX-mode-hook 'reftex-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-revert-mode)
(add-hook 'LaTeX-mode-hook 'font-lock-mode)
(add-hook 'tex-mode-hook 'turn-on-auto-revert-mode)
(add-hook 'tex-mode-hook 'font-lock-mode)
(add-hook 'cperl-mode-hook 'turn-on-auto-revert-mode)
(add-hook 'cperl-mode-hook 'font-lock-mode)
(add-hook 'perl-mode-hook 'turn-on-auto-revert-mode)
(add-hook 'perl-mode-hook 'font-lock-mode)
(add-hook 'asm-mode-hook 'font-lock-mode)
(add-hook 'makefile-mode-hook 'font-lock-mode)
(add-hook 'sql-mode-hook 'turn-on-auto-revert-mode)

(add-hook 'c-mode-common-hook
          (lambda ()
            (global-set-key (kbd "C-c o") 'ff-find-other-file)
            (global-set-key (kbd "C-c s") 'find-grep)
            ))

;customizations for both c-mode and c++-mode
(defun my-c-mode-common-hook ()
  ;; set up for my perferred indentation style, but only do it once
  (c-set-style "bsd")
  (setq c-basic-offset 4)
  ;; offset customizations not in my-c-style
  ;; other customizations
  (setq tab-width 3
    ;; this will make sure spaces are used instead of tabs
    indent-tabs-mode t)
  ;; we like auto-newline and hungry-delete
  (c-toggle-auto-hungry-state 1)
  ;; keybindings for C, C++, and Objective-C.  We can put these in
  ;; c-mode-map because c++-mode-map and objc-mode-map inherit it
  ;;(define-key c-mode-map "f10" 'compile)
  )
(defun neuraliq-code-conventions-hook ()
    "C and C++ modes to conform to NeuralIQ Code Conventions"
    (interactive)
    (c-set-style "bsd")
    (setq
          tab-width 8
          c-basic-offset 8
          indent-tabs-mode t)
    (c-toggle-auto-hungry-state 1)
)

(defun my-fundamental-mode-hook ()
    "Fundamental mode hook"
    (interactive)
    (setq tab-width 8)
    (setq indent-tabs-mode nil)
)

(defun my-sql-mode-hook ()
  (setq tab-width 8)
  (setq indent-tabs-mode nil)
)

;;(add-hook 'c-mode-hook 'my-c-mode-common-hook)
;;(add-hook 'c++-mode-hook 'my-c-mode-common-hook)
(add-hook 'c-mode-hook 'neuraliq-code-conventions-hook)
(add-hook 'c++-mode-hook 'neuraliq-code-conventions-hook)

(add-hook 'fundamental-mode-hook 'my-fundamental-mode-hook)
(add-hook 'sql-mode-hook 'my-sql-mode-hook)


(setq gdb-command-name "ddd")

(defun dos2unix ()
 "Convert a buffer from MS-DOS ^M end of lines to UNIX end of lines."
  (interactive)
    (goto-char (point-min))
      (while (search-forward "\r" nil t) (replace-match "")))
(defun unix2dos ()
  "Convert a buffer from UNIX end of lines to MS-DOS ^M end of lines."
  (interactive)
    (goto-char (point-min))
      (while (search-forward "\n" nil t) (replace-match "\r\n")))


;;******************************************************************************
;; Packages
;;******************************************************************************
 (autoload 'mwheel-install "mwheel" "Enable mouse wheel support.")

 (mwheel-install)
;(load "big-menubar")
;(load-library "completer")
;(require 'supercite)
;(require 'delbs)
;(delbs-enable-delete-forward)
;(require 'recent-files)
;(recent-files-initialize)
;;******************************************************************************
;; Defines
;;******************************************************************************
(setq frame-title-format "%S: %f")
(setq line-number-mode t)
(setq c-brace-offset 0)
(setq visible-bell t)               ; Quiet, the baby's asleep
(setq next-line-add-newlines nil)       ; Don't extend buffer
;;(setq gnuserv-frame (selected-frame))
(setq default-tab-width 4)
;(set-face-background `default "wheat")
;(set-face-foreground `default "black")
;(set-face-foreground `blue "skyblue1")
;(set-face-foreground `bold "black")
;(set-face-foreground `font-lock-doc-string-face "green20")
;(set-face-foreground `font-lock-function-name-face "royalblue2")
;(set-face-foreground `font-lock-preprocessor-face "grey5")
;(set-face-foreground `font-lock-reference-face "turquoise4")
;(set-face-foreground `font-lock-string-face "green5")
;(set-face-foreground `font-lock-type-face "blue2")
;(set-face-foreground `font-lock-variable-name-face "green20")
;(set-face-background `primary-selection "gray35")

;;******************************************************************************
;; Key bindings
;;*********************************************
(global-set-key "\C-v" "\C-y")
(global-set-key "\C-xw" 'what-line)
(global-set-key (quote [f5]) 'compile)
(global-set-key (quote [f6]) 'gdb)
;(global-set-key "\c-1" "\c-\M-n") ; Move down staying on the same syntax level
;(global-set-key "\c-1" "\c-\M-p") ; Move up staying on the same syntax level
;(global-set-key "\c-1" "\c-\M-a") ; Move to start of function
;(global-set-key "\c-1" "\c-\M-e") ; Move to end of function

(global-set-key (quote [f2]) 'dabbrev-expand)
(global-set-key (quote [f1]) 'dabbrev-completion)
;(global-set-key (quote "\C-1") 'dabbrev-expand)
;(global-set-key (quote "\C-2") 'dabbrev-completion)


;;******************************************************************************
;; Misc
;;******************************************************************************
;;(require 'auto-show)
;;;(set-specifier scrollbar-height 0)
;;(setq truncate-lines t)

;(display-time)

;(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

(setq favourite-files '(
  "." "~"
  "~/.emacs"
  ))


;;; Display time and mail notification

;(defun display-time-in-icon ()
;  "Display the time and presence of new mail as the icon name."
;  (let ((s (current-time-string)))
;    (frame-title (concat (substring s 11 16)
;            " " (substring s 0 4)
;            (substring s 8 10)
;            (and (new-mail-p) " MAIL"))
;        default-minibuffer-frame))
;  (setq display-time-string ""))

(global-set-key "\C-xs" 'isearch-from-top)

;; Menus
;;******************************************************************************
;;(add-submenu
;; nil
;; '("Misc"
;;   ["Shell Script" sh-shript-mode t]
;;   ["Awk" awk-mode t]
;;   ["Perl" perl-mode t]
;;   ["C/C++" cc-mode t]
;;   ["Tcl" tcl-mode t]
;;   ["Text" text-mode t]
;;   ["Enriched" enriched-mode t]
;;   ["Make" make-mode t]
;;   ["View Processes" view-process-mode t]
;;   )
;;"Tools")

;;******************************************************************************
;; Auto insert
;;******************************************************************************
;;(require 'autoinsert)
;;(add-hook 'find-file-hooks 'auto-insert)
;;(setq auto-insert-directory (expand-file-name "~/emacs/autoinsert/"))
;;(define-auto-insert "\\.sh\\'" "autoinsert.sh")

;;******************************************************************************
;; Auto save
;;******************************************************************************
;(setq auto-save-directory (expand-file-name "~/autosave/")
;      auto-save-directory-fallback auto-save-directory
;      auto-save-hash-p nil
;      ange-ftp-auto-save t
;      ange-ftp-auto-save-remotely nil
;       ;; now that we have auto-save-timeout, let's crank this up
;      ;; for better interactive response.
;      auto-save-interval 2000
;      )
;;; We load this afterwards because it checks to make sure the
;;; auto-save-directory exists (creating it if not) when it's loaded.
;(require 'auto-save)



;;******************************************************************************
;; Func
;;******************************************************************************
;;(cond (running-xemacs
;(require 'func-menu)
;(define-key global-map 'f8 'function-menu)
;(add-hook 'find-file-hooks 'fume-add-menubar-entry)
;(define-key global-map 'f9 'fume-list-functions)
;(define-key global-map 'f10 'fume-prompt-function-goto)

;; The Hyperbole information manager package uses (shift button2) and
;; (shift button3) to provide context-sensitive mouse keys.  If you
;; use this next binding, it will conflict with Hyperbole's setup.
;; Choose another mouse key if you use Hyperbole.
;(define-key global-map '(shift button3) 'mouse-function-menu)

;; For descriptions of the following user-customizable variables,
;; type C-h v <variable>
(setq fume-max-items 40
      fume-fn-window-position 3
      fume-auto-position-popup t
      fume-display-in-modeline-p t
      fume-menubar-menu-location nil
      fume-buffer-name "*Function List*"
      fume-no-prompt-on-valid-default nil)
;;       ))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(current-language-environment "English")
 '(diary-nonmarking-symbol "&" t)
 '(dired-keep-marker-copy 67)
 '(dired-keep-marker-hardlink 72)
 '(dired-keep-marker-rename t)
 '(dired-keep-marker-symlink 89)
 '(dired-ls-F-marks-symlinks nil)
 '(scroll-bar-mode (quote right))
 '(speedbar-show-unknown-files t)
 '(split-height-threshold 1000)
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(highlight-changes-face ((((class color)) (:background "black" :foreground "white"))))
 '(region ((((class color) (background light)) (:background "lightgoldenrod2")))))


(custom-set-variables
 '(grep-find-command "find . -name '*.c' -o -name '*.cc' -o -name '*.h' | xargs grep -nIH -e "))

;;******************************************************************************
;; resize-minibuffer-mode makes the minibuffer automatically
;; resize as necessary when it's too big to hold its contents.
;;******************************************************************************
;(autoload 'resize-minibuffer-mode "resize-minibuffer-mode" nil t)
;(resize-minibuffer-mode)
;(setq resize-minibuffer-window-exactly nil)

(load "desktop")
;;(setq desktop-missing-file-warning nil)
;;(desktop-load-default)
;;(desktop-read)
;;(desktop-save-mode 1)


;(setq semantic-load-turn-everything-on t)
;(require 'semantic-load)
;(require 'ecb)

; find file at point
 (require 'ffap)                      ; load the package
 (ffap-bindings)                      ; do default key bindings
;;


;;(gnuserv-start)


;(push '("/.*" . binary) process-coding-system-alist)



(setq minibuffer-max-depth nil)

(put 'upcase-region 'disabled nil)

(put 'scroll-left 'disabled nil)


;; Lisp
(setq inferior-lisp-program "clisp")
;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime")
;;(require 'slime)
;;(slime-setup '(slime-fancy))




(global-set-key (kbd "C-c p") 'find-grep-project)

(global-set-key (kbd "C-c C-c") 'comment-region)

;; find-grep-project

(defun project-root (&optional dir)
  (let* ((dir (file-name-as-directory (or dir (expand-file-name "."))))
         (gitdir (concat dir ".git/")))
    (cond ((equal dir "/") nil)
          ((file-directory-p gitdir) (directory-file-name dir))
          (t (project-root (expand-file-name (concat dir "..")))))))

(defun in-git-project ()
  (when (project-root)
    t))

(defun find-grep-project (&optional query)
  "find-grep from project root"
  (interactive)
  (let ((project-root (project-root)))
    (if project-root
        (let* ((grep-find-command (concat "find " project-root
                                          " -type f -not -regex '" project-root
                                          "/.svn/.*' -not -name '*.o' -print0 | xargs -0 grep -i -n " query)))
          (call-interactively 'grep-find))
      (error "Not inside a git repository"))))

;; load protobuf mode
(load "protobuf-mode.el")

(defconst my-protobuf-style
  '((c-basic-offset . 8)
     (indent-tabs-mode . nil)))

(add-hook 'protobuf-mode-hook
  (lambda () (c-add-style "my-style" my-protobuf-style t)))

(setq auto-mode-alist
        (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                  ("\\.cmake\\'" . cmake-mode))
                auto-mode-alist))


;; Load color theme
(load "color-theme.el")
(load "color-theme-sunburst.el")
(color-theme-tm)

(setq auto-mode-alist (append '(("\\.lua$\\'" . lua-mode)) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-hook 'lua-mode-hook 'turn-on-font-lock)


;; load flex/bison mode
(load "flex-mode.el")
(load "bison-mode.el")


; set browse-url browser
(setq browse-url-browser-function 'browse-url-generic
  browse-url-generic-program "/opt/google/chrome/chrome")

;(set-face-font `default "6x13")

(put 'downcase-region 'disabled nil)

(defun uncamelcase-string (s &optional sep start)
  "Convert CamelCase string S to lower case with word separator SEP.
    Default for SEP is a hyphen \"-\".
    If third argument START is non-nil, convert words after that
    index in STRING."
  (let ((case-fold-search nil))
    (while (string-match "[A-Z]" s (or start 1))
      (setq s (replace-match (concat (or sep "-")
                                     (downcase (match-string 0 s)))
                             t nil s)))
    (downcase s)))

(c-add-style "sailfish"
             '("linux"
               (c-offsets-alist
                (inline-open . 0))))


;; skip .svn directories
(setq grep-find-ignored-directories
      (append ".svn"))
