# Path to your oh-my-zsh installation.
  export ZSH=/home/marko/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gitfast github go node npm pip postgres redis-cli zsh_reload)

source $ZSH/oh-my-zsh.sh
source ~/.profile
source ~/.aliases.sh
source ~/.secrets.sh

SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_FORMAT=%T

# Completions
source <(doctl completion zsh)
source <(kubicorn completion zsh)
source <(kubectl completion zsh)
