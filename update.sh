#!/bin/bash

set -euo pipefail
cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

curl -s 'https://odyssey.starbucks.com/api/copydeck/en-US?nodes=account,benefits,cookie_gate,profile_information,help_message,journey_cards,notifications,dashboard,points_ledger,buttons,global,links,share' \
  | jq > current.json

git add current.json &&
  GIT_AUTHOR_NAME="auto" \
  GIT_AUTHOR_EMAIL="" \
  GIT_COMMITTER_NAME="auto" \
  GIT_COMMITTER_EMAIL="" \
  git commit -m "Auto-update $(date -u)" --no-gpg-sign && git push > /dev/null
