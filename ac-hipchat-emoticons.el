;;; ac-hipchat-emoticons --- auto-complete source for HipChat emoticons
;;;
;;; Copyright (C) 2016 Torstein Krause Johansen
;;;
;;; This program is free software: you can redistribute it and/or
;;; modify it under the terms of the GNU General Public License as
;;; published by the Free Software Foundation, either version 3 of the
;;; License, or (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;; General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program.  If not, see
;;; <http://www.gnu.org/licenses/>.
;;;
;;; Commentary:
;;;
;;; Add ac-hipchat-emoticons to your loadpath, then run:
;;;
;;; M-x ac-hipchat-emoticons-setup
;;;
;;; Now, if you've enabled auto-complete mode for the current buffer,
;;; typing "(" should bring up the HipChat emoticon completion
;;; candidates.
;;;
;;; Enjoy!
;;;
;;; -Torstein
;;;
;;; Code:

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

(defun ac-hipchat-emoticon-complete ()
  "Complete the emoticon."
  (insert ")"))

(ac-define-source hipchat-emoticons
  '((candidates . ac-hipchat-emoticons--candidates)
    (action . ac-hipchat-emoticon-complete)
    (symbol . "😃")
    (prefix . "(\\(.*\\)")))

;;;###autoload
(defun ac-hipchat-emoticons-setup ()
  "Add HipChat emoticons to the AC sources."
  (interactive)
  (add-to-list 'ac-sources 'ac-source-hipchat-emoticons))

(provide 'ac-hipchat-emoticons)

;;; ac-hipchat-emoticons.el ends here
