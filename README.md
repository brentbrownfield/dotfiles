dotfiles
========

Follow instructions from https://www.atlassian.com/git/tutorials/dotfiles

```su - ; apt install sudo ; adduser brent sudo```

```sudo apt install -y tmux curl git openjdk-11-jdk-headless vim zsh python3-pip python3-argcomplete```

```wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash```

```pip3 install argcomplete```

```sudo activate-global-python-argcomplete3```

```chsh -s /usr/bin/zsh```

Exit and log back in

```sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"```

```curl -Lks http://bit.ly/cfg_install | /bin/bash```

Exit and log back in

```nvm install --lts```
