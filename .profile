# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Get it from the original Git repo: 
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

# Get it from the original Git repo: 
# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
# Bash
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi
# Zsh
# Get it from the original Git repo:
# https://github.com/git/git/blob/master/contrib/completion/git-completion.zsh
if [ -f ~/.git-completion.zsh ]; then
  source ~/.git-completion.zsh
fi

# Colored man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Go paths
export GOROOT=/usr/local/go
export GOROOT_BOOTSTRAP=$GOROOT
export GOPATH=$HOME
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export CDPATH=$CDPATH:/home/marko/src/github.com/xmudrii/
