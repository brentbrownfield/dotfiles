function config --description 'Manage dotfiles with git'
    set -l git (which git)
    $git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
end
