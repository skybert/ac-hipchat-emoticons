;;; package --- Emacs auto-completion of HipChat emoticons
;;;
;;; Commentary:

(require 'popup)
(require 'cl-macs)
(require 'ac-hipchat-emoticons-data)

(defvar ac-hipchat-emoticons--candidates
  (cl-loop
   for
   hipchat-nick in ac-hipchat-emoticons--data
   collect
   (popup-make-item
    (plist-get hipchat-nick :key)
    :summary (plist-get hipchat-nick :name)
    :document (plist-get hipchat-nick :description))))

;;;###autoload
(defun ac-hipchat-emoticons-setup ()
  (interactive)
  (add-to-list 'ac-sources 'ac-source-hipchat-emoticons))

(ac-define-source hipchat-emoticons
  '((candidates . ac-hipchat-emoticons--candidates)
    (prefix . "(\\(.*\\)")))

(provide 'ac-hipchat-emoticons)

;;; ac-hipchat-emoticons.el ends here
