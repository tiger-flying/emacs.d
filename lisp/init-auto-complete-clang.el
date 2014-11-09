;;; init-auto-complete-clang --- configure auto-complete-clang
;;; Commentary:

;;; Code:
(require-package 'auto-complete-clang-async)

(require 'auto-complete-clang-async)

(defun ac-cc-mode-setup ()
  ;; you should change the server program's path here
  (setq ac-clang-complete-executable "~/.emacs.d/bin/clang-complete")
  (setq ac-sources (append '(ac-source-clang-async) ac-sources))
  (ac-clang-launch-completion-process)
  )

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (global-auto-complete-mode t))

(my-ac-config)

(provide 'init-auto-complete-clang)
;;; init-auto-complete-clang ends here
