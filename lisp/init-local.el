; ----------------------------------------------------------------------------:
; Encoding Configuration
; ----------------------------------------------------------------------------:

(set-language-environment "Korean")
(prefer-coding-system 'utf-8)
(global-unset-key (kbd "S-SPC"))

(if (eq window-system 'w32)
    (progn
      ;; http://oldpie.yoonkn.com/cgi-bin/moin.cgi/EmacsFontSet
      ;; http://oldpie.yoonkn.com/cgi-bin/moin.cgi/dreamstorm/emacs
      ;; http://www.emacswiki.org/cgi-bin/wiki/FontSets
      ;; by hosung 2008-05-20
      ;; http://www.gnu.org/software/emacs/windows/faq5.html#windows-font
      ;; M-x set-default-font <RET> <TAB>하면 폰트리스트가 나온다.
      ;; 폰트크기 18은 맨 첫줄을 따라 가는 것 같다. ksc5601에서 작게 해도 한글이 작아지지는 않는다.
      ;; ksc5601에서 c는 실제 p로 나오는데 어떤 것을 해도 상관 없다.
      ;; 맨끝의 0을 *로 하면 정상적으로 폰트가 출력되지 않는다.
      ;;
      ;; 이와 같이 ksc5601로 하면 확장문자에 대하여 네모박스로 출력되는 문제가 있다.
      (setq initial-frame-alist '((top . 10) (left . 100)))
      (setq default-frame-alist
        (append
         '(
           (font . "-*-Monaco-normal-r-*-*-13-102-120-120-c-*-iso8859-1")
           (width . 140)
           (height . 47)
           )
         default-frame-alist))))

;; ----------------------------------------------------------------------------
;; Easier transition between windows
;; ----------------------------------------------------------------------------
(windmove-default-keybindings 'meta)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(load-theme 'monokai t)
(setq-default tab-width 4)
(setq js-indent-level 4)
(setq-default indent-tabs-mode nil)

;;-------------------------------------------------------------------------------
;; Alternate linux grep to win32 grep
;;-------------------------------------------------------------------------------

(when (or (eq system-type 'windows-nt) (eq system-type 'msdos))
  (setenv "PATH" (concat "C:\\Users\\coozplz\\AppData\\Roaming\\GetGnuWin32\\bin;" (getenv "PATH")))
  (setq find-program "C:\\Users\\coozplz\\AppData\\Roaming\\GetGnuWin32\\bin\\find.exe"
        grep-program "C:\\Users\\coozplz\\AppData\\Roaming\\GetGnuWin32\\bin\\grep.exe"))


(add-hook 'html-mode-hook
          (lambda()
            (setq sgml-basic-offset 4)
            (setq indent-tabs-mode t)))

;;-------------------------------------------------------------------------------
;; Shell command output to buffer.
;;-------------------------------------------------------------------------------

(defun shell-command-on-buffer ()
  (interactive)
  (shell-command-on-region
   (point-min) (point-max)
   (read-shell-command "Shell command on buffer: ")))


(provide 'init-local)
