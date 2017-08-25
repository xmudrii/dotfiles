#!/bin/bash

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"
## Personal
alias c="cd ~/src/github.com/xmudrii"
alias cdo="cd ~/src/github.com/digitalocean"
alias ck="cd ~/src/github.com/kris-nova/kubicorn"
alias d="cd ~/DigitalOcean"

# Shortcuts
alias g="git"
alias h="history"

# List
alias l="ls -lF --color -h --group-directories-first"
alias la="ls -laF -h --color"
alias ls='ls -l --color -h --group-directories-first'
## list only directories
alias lsd="ls -lF -h --color | grep --color=never '^d'"
## Colors
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Grep - always colored
alias grep='grep --color=auto '

# Date and time
## Get week number
alias week='date +%V'
## Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# IP addresses
alias pubip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="sudo ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias ips="sudo ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# instant web server
alias serve-me="python -m SimpleHTTPServer 8000"

# Kills all processes running on the specified port (e.g. 'killport 8080')
killport() {
  lsof -i tcp:$1 | awk '(NR!=1) && ($1!="Google") && ($1!="firefox") {print $2}' | xargs kill
}

# VHosts
alias hosts='sudo vim /etc/hosts'

# Untar
alias untar='tar xvf'

# Extract the given file
unpack () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Make directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$@"
}

# pretty visual git history
alias git-pretty="git log --graph --oneline --all --decorate"

# restart window
alias wtf="source ~/.zshrc"

# Shruggie
alias shruggie="printf \"¯\_(ツ)_/¯\" | pbcopy && echo \"¯\_(ツ)_/¯ copied to clipboard\""
