# Path to your oh-my-zsh installation.
export ZSH="/Users/marko/.oh-my-zsh"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Use GNU tools
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH=/opt/homebrew/opt/curl/bin:$PATH
export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker
  httpie
)

source $ZSH/oh-my-zsh.sh

# User configuration
[ -f ~/.zsh_env ] && source ~/.zsh_env
[ -f ~/.zsh_func ] && source ~/.zsh_func
[ -f ~/.zsh_alias ] && source ~/.zsh_alias
[ -f ~/.zsh_docker ] && source ~/.zsh_docker
[ -f ~/.zsh_private ] && source ~/.zsh_private

## Auto completions

# kubectl
if kubectl --help >/dev/null 2>&1; then
  source <(kubectl completion zsh)
  complete -o default -F __start_kubectl k
fi
# kubeone
if kubeone --help >/dev/null 2>&1; then
  source <(kubeone completion zsh)
fi
# doctl
if doctl --help >/dev/null 2>&1; then
  source <(doctl completion zsh)
fi

# fubectl: https://github.com/kubermatic/fubectl
[ -f ~/.fubectl.source ] && source ~/.fubectl.source

# fzf
source /opt/homebrew/Cellar/fzf/*/shell/key-bindings.zsh
source /opt/homebrew/Cellar/fzf/*/shell/completion.zsh

# direnv
eval "$(direnv hook zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
