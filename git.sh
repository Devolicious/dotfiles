
alias gmerged='git branch --merged | egrep -v "(^\*|master|dev)"'
alias gcmerge='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias gmergedremote='git branch -r --merged | egrep -v "(^\*|master|dev)" | sed "s/origin\///"'
alias gcmergeremote='git branch -r --merged | egrep -v "(^\*|master|dev)" | sed "s/origin\///" | xargs -n 1 git push --delete origin'