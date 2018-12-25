# Path to your oh-my-zsh installation.
export ZSH="/home/marko/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Powerline9k configuration
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time context root_indicator ssh)

POWERLEVEL9K_STATUS_VERBOSE=false

POWERLEVEL9K_DIR_PATH_SEPARATOR="%F{white} $(print $'\uE0B1') %F{white}"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_DELIMITER="…"
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_folders

POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"

POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND='black'
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND='magenta'

POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="000"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="007"

POWERLEVEL9K_HOME_ICON=' '
POWERLEVEL9K_HOME_SUB_ICON=' '
POWERLEVEL9K_FOLDER_ICON=' '

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Hide the percent sign in terminal
setopt PROMPT_CR
setopt PROMPT_SP
export PROMPT_EOL_MARK=""

# Auto completions
# kubectl
if kubectl --help >/dev/null 2>&1; then
  source <(kubectl completion zsh)
  complete -o default -F __start_kubectl k
fi
# doctl
if doctl --help >/dev/null 2>&1; then
  source <(doctl completion zsh)
fi
# kubectx: https://raw.githubusercontent.com/ahmetb/kubectx/master/completion/kubectx.zsh
if [ -f ~/.kubectx-completion.bash ]; then
  source ~/.kubectx-completion.bash
fi
# kubens: https://raw.githubusercontent.com/ahmetb/kubectx/master/completion/kubens.zsh
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
# fubectl: https://github.com/kubermatic/fubectl
if [ -f ~/.fubectl.bash ]; then
  source ~/.fubectl.bash
fi

