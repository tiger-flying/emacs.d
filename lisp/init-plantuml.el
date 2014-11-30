;;; init-plantuml --- configure artist
;;; Commentary:

;;; Code:
(require-package 'plantuml-mode)
(require 'auto-complete-config)
(add-to-list 'ac-modes 'plantuml-mode)

;; should be indentical to org-plantuml-jar-path
(setq plantuml-jar-path
      (expand-file-name "~/.emacs.d/jar/plantuml.jar"))


(provide 'init-plantuml)
;;; init-plantuml ends here
