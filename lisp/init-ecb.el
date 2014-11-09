;;; init-ecb --- configure ecb
;;; Commentary:

;;; Code
(require-package 'ecb)

(require 'ecb)
; disable the tip-of-the-day window, it is annoying and most importantly, it will hang my emacs
(setq ecb-tip-of-the-day nil)

; defualt value is 'mouse-2--C-mouse-2, so that I can't open file by clicking.
; Change to 'mouse-1--C-mouse-1 to enable click-to-open.
(setq ecb-primary-secondary-mouse-buttons 'mouse-1--C-mouse-1)

(provide 'init-ecb)
;;; init-ecb ends here
