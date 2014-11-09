;;; init-c --- configure for C/C++ development
;;; Commentary:

;;; Code:

;; treat ".h" files as C++ header files by default
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; detect C++ header files if the files name have no suffix
;; this code snippet is copied from http://www.emacswiki.org/emacs/CPlusPlusMode
(require 'cl)

(defun file-in-directory-list-p (file dirlist)
  "Returns true if the file specified is contained within one of
the directories in the list. The directories must also exist."
  (let ((dirs (mapcar 'expand-file-name dirlist))
        (filedir (expand-file-name (file-name-directory file))))
    (and
     (file-directory-p filedir)
     (member-if (lambda (x) ; Check directory prefix matches
                  (string-match (substring x 0 (min(length filedir) (length x))) filedir))
                dirs))))

(defun buffer-standard-include-p ()
  "Returns true if the current buffer is contained within one of
the directories in the INCLUDE environment variable."
  (and (getenv "INCLUDE")
       (file-in-directory-list-p buffer-file-name (split-string (getenv "INCLUDE") path-separator))))

(add-to-list 'magic-fallback-mode-alist '(buffer-standard-include-p . c++-mode))
;; detect C++ header end

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
