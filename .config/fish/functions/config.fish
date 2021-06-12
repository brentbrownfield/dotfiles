# Defined in /data/data/com.termux/files/usr/tmp/fish.nLdHRD/config.fish @ line 2
function config --description 'Manage dotfiles with git'
    set -l git (which git)
    $git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
end
