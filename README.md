dotfiles
========

TL;DR

Install oh-my-zsh:
```sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"```

```curl -Lks http://bit.ly/cfg_install | /bin/bash```

Otherwise follow instructions from https://www.atlassian.com/git/tutorials/dotfiles.
This approach creates a bare repository in the home directory in .cfg. Then an alias
is created which specifies the git home directory as well as a working directory.
