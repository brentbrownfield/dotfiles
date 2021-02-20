alias -s ps=gv
alias -s js=st
alias -s java=st
alias -s xml=st
alias -s txt=st
alias -s json=st
alias vl='less *.log(.om[1])'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias glo='/usr/bin/git log --pretty=format:"%h - %an, %<(15)%ar : %s"'
alias sdu='du -h --max-depth 1 | sort -h'
alias reload='exec $SHELL -l'
alias dfh='df -x tmpfs -x squashfs -x devtmpfs -x overlay -h | body sort'
alias kubectl='microk8s kubectl'
alias helm='microk8s helm3'
