;;; init-c --- configure for C/C++ development
;;; Commentary:

;;; Code:
;; detect and add headers path, to make flycheck and clang-complete work

(defun check-and-add-header-path (checkpath)
  "Check if CHECKPATH exists and it's a directory, if it is a directory, then and it to 'ac-clang-cflags and 'flycheck-clang-include-path."
  (if (file-directory-p checkpath)
      (progn
        (add-to-list 'ac-clang-cflags (format "%s%s" "-I" checkpath))
        (add-to-list 'flycheck-clang-include-path checkpath))))

(defun my-c-setup ()
  "Setup local variables when loading a C/C++ file."
  ;; make sure flycheck-mode is enabled
  (flycheck-mode t)
  (check-and-add-header-path "include")
  (check-and-add-header-path "../include")
  (check-and-add-header-path "inc")
  (check-and-add-header-path "../inc")
  (check-and-add-header-path "/usr/local/include/gtest"))

(add-hook 'c-mode-common-hook 'my-c-setup)
;; detect and add header end

(provide 'init-c)
;;; init-c ends here
