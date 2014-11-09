;;; init-unicad --- Initialize unicad. If it doest not exist, download it
;;; Commentary:

;;; Code:
(unless (require 'unicad nil 'noerror)
  (progn
    (mkdir "~/.emacs.d/site-lisp/unicad/")
    (url-copy-file "https://unicad.googlecode.com/svn/trunk/lisp/unicad.el" "~/.emacs.d/site-lisp/unicad/unicad.el" t)))

(provide 'init-unicad)
;;; init-unicad ends here
