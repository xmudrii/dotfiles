# Path to your oh-my-zsh installation.
export ZSH=/home/marko/.oh-my-zsh
export LANG=en_US.UTF-8

# Set name of the theme to load. Optionally, if you set this to "random"
ZSH_THEME="gianu"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_env
