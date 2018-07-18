# Path to your oh-my-zsh installation.
export ZSH="/home/marko/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gianu"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker
)

source $ZSH/oh-my-zsh.sh

# User configuration
[ -r ~/.zsh_env ] && source ~/.zsh_env
[ -r ~/.zsh_private ] && source ~/.zsh_private
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Command history
bindkey "^r" history-incremental-pattern-search-backward
KEYTIMEOUT=1

# Auto completions
# kubectl
if kubectl --help >/dev/null 2>&1; then
  source <(kubectl completion zsh)
  complete -o default -F __start_kubectl k
fi
# kubectx
if [ -f ~/.kubectx-completion.bash ]; then
  source ~/.kubectx-completion.bash
fi
# kubens
if [ -f ~/.kubens-completion.bash ]; then
  source ~/.kubens-completion.bash
fi
# git-prompt: https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi
# git-completion: https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

# auto-completion/syntax highlighting
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=0'

