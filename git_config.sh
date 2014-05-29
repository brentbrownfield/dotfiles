#!/bin/sh
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.co checkout
git config --global alias.df diff
git config --global alias.dc 'diff --cached'
git config --global alias.lg 'log -p'
git config --global alias.lol 'log --graph --decorate --prettyoneline --abbrev-commit'
git config --global alias.lola 'log --graph --decorate --prettyoneline --abbrev-commit --all'
git config --global alias.ls 'ls-files'
git config --global alias.ign 'ls-files -o -i --exclude-standard'
git config --global alias.pl 'pull --recurse-submodules'
git config --global color.ui auto
git config --global color.branch.current 'yellow reverse'
git config --global color.branch.local yellow
git config --global color.branch.remote green
git config --global color.diff.meta 'yellow bold'
git config --global color.diff.frag 'magenta bold'
git config --global color.diff.old 'red bold'
git config --global color.diff.new 'green bold'
git config --global color.status.added yellow
git config --global color.status.changed green
git config --global color.status.untracked cyan
git config --global color.diff.whitespace 'red reverse'
git config --global core.whitespace 'fix,-indent-with-non-tab,trailing-space,cr-at-eol'
git config --global fetch.recursesubmodules true
git config --global branch.autosetuprebase always
