;;; init-unicad --- Initialize unicad. If it doest not exist, download it
;;; Commentary:

;;; Code:
(unless (require 'unicad nil 'noerror)
  (progn
    (mkdir "~/.emacs.d/site-lisp/unicad/")
    (url-copy-file "https://github.com/emacsmirror/unicad/raw/master/unicad.el" "~/.emacs.d/site-lisp/unicad/unicad.el" t)))

(provide 'init-unicad)
;;; init-unicad ends here
