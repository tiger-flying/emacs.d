;;; init-dtrt-indent --- Automatically guess offsets for C/C++ and Java files
;;; Commentary:

;;; Code:
(unless (require 'dtrt-indent nil 'noerror)
  (shell-command "git clone https://github.com/jscheid/dtrt-indent.git ~/.emacs.d/site-lisp"))

(dtrt-indent-mode 1)

(provide 'init-dtrt-indent)
;;; init-dtrt-indent ends here
