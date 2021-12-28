dotfiles
========

TL;DR

```sh -c "$(curl -fsSLk https://bit.ly/cfg_install)"```

For those not interested in blindly downloading a scrip via URL shorteners, 
the above bit.ly link can be viewed at https://gist.githubusercontent.com/brentbrownfield/f74feecdd63d1711e255f1316ce0dc03/raw/102a3ef5ad858ae03f87d4f180fddf6caaaba510/cfg-install
Otherwise follow instructions from https://www.atlassian.com/git/tutorials/dotfiles.
This approach creates a bare repository in the home directory in .cfg. Then an alias
is created which specifies the git home directory as well as a working directory.
