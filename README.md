dotfiles
========

TL;DR

Install oh-my-zsh

```sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"```

Install dotfiles

```sh -c "$(curl -fsSLk https://git.home.brownfield.soy/brent/scratch/raw/branch/master/install_dotfiles.sh)"```

Change shell to zsh

```chsh -s $(which zsh)```

Otherwise follow instructions from https://www.atlassian.com/git/tutorials/dotfiles.
This approach creates a bare repository in the home directory in .cfg. Then an alias
is created which specifies the git home directory as well as a working directory.
