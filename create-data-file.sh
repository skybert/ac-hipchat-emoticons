#! /usr/bin/env bash

# by torstein.k.johansen@gmail.com
set -o errexit
set -o nounset
set -o pipefail

read_user_input() {
  :
}

main() {
  read_user_input "$@"

  local hipchat_emoticons_list=$(
    curl -s https://www.hipchat.com/emoticons | \
      sed -r -n 's#.*<div>[(](.*)[)]</div>#\1#p' | \
      sort | \
      uniq)

  local file=ac-hipchat-emoticons-data.el
  cat > ${file} <<EOF
;; Generated by $(basename $0) @ $(date) on $(hostname)
(defvar ac-hipchat-emoticons--data
  '(
EOF
  for el in ${hipchat_emoticons_list}; do
    cat >> ${file} <<EOF
    (:key "${el}" :name "HipChat (${el})" :description "HipChat Emoticon (${el})")
EOF
  done
  cat >> ${file} <<EOF
))
(provide 'ac-hipchat-emoticons-data)
EOF
}

main "$@"







