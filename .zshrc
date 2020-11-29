# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.ohmyzsh_custom

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git common-aliases git-extras git-flow mvn npm sublime svn z colored-man-pages ssh-agent zsh_reload)

if [ -f $HOME/.ssh/id_rsa_personal -a -f $HOME/.ssh/id_rsa_codehoist ]; then
    zstyle :omz:plugins:ssh-agent identities id_rsa_personal id_rsa_codehoist
fi

source $ZSH/oh-my-zsh.sh

# User configuration
export JAVA_HOME="/usr/lib/jvm/default-java"
export GOPATH="$HOME/go"

PATH=".:$HOME/.local/bin:$HOME/bin:$HOME/.npm-packages/bin"

# If the GOPATH environment variable is set the append the bin
# directory foud inside thhe go folder
if [ ! -z $GOPATH -a -d $GOPATH/bin ]; then
    PATH="$PATH:$GOPATH/bin";
fi

LOCALGO="/usr/local/go/bin";

# Add Go to the path if it is foud in /usr/local/go/bin
if [ -d $LOCALGO ]; then
    PATH="$PATH:$LOCAL_GO";
fi

# If the JAVA_HOME environment variable is set then append the bin
# directory found inside the java home directory to the path
if [ ! -z $JAVA_HOME -a -d $JAVA_HOME/bin ]; then
    PATH="$PATH:$JAVA_HOME/bin";
fi

# If the prefix environment variable is set, as is the case in termux
# then append the bin directory found inside prefix to the path
if [ ! -z $PREFIX -a -d $PREFIX/bin ]; then
    PATH="$PATH:$PREFIX/bin";
fi

# If the snap directory exists add its bin directory to the path
if [ -d /snap/bin ]; then
    PATH="$PATH:/snap/bin";
fi

# Add the sbin directories found in most linux distributions.
# This is useful for running sudo commands.
PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin";

export PATH;

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export LD_LIBRARY_PATH=/usr/lib:$LD_LIBRARY_PATH

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

autoload -U +X bashcompinit && bashcompinit

REGISTER_PYTHON_ARGCOMPLETE=`which register-python-argcomplete3`;

if [ $? -eq 1 ]; then
    REGISTER_PYTHON_ARGCOMPLETE=`which register-python-argcomplete`;
fi

if [ $? -eq 0 ]; then
    eval "$($REGISTER_PYTHON_ARGCOMPLETE /etc/bash_completion.d/python-argcomplete.sh)"
fi

complete -o nospace -C /usr/local/bin/vault vault

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export HISTCONTROL='ignorespace'

# Test for WSL/WSL2. Normally 'uname -o' could be used by the version
# used in WSL does not support the operating system flag of uname :(
# Need to research the proper usage of [[]], to understand how/when/if
# the multiple if statements can be reduced to a single test
OSRELEASE="/proc/sys/kernel/osrelease"
if [ -r $OSRELEASE ]; then
    if [[ -r $OSRELASE -a "$(< $OSRELEASE)" == *microsoft* ]]; then 
        [ -z "$(ps -ef | grep cron | grep -v grep)" ] && sudo /etc/init.d/cron start &> /dev/null
        export PATH=$PATH:/mnt/c/Windows/System32
    fi
fi

CMD_TERRAFORM="$(which terraform)"
if [ $? -eq 0 ]; then
    complete -o nospace -C $CMD_TERRAFORM terraform
fi

CMD_VAULT="$(which vault)"
if [ $? -eq 0 ]; then
    complete -o nospace -C $CMD_VAULT vault
fi
