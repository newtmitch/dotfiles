# Path to your oh-my-zsh installation.
export ZSH=/Users/mitch/.oh-my-zsh

if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

# rsm: debug zsh load times
# zmodload zsh/zprof


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="cobalt2"
#ZSH_THEME="gnzh"
#ZSH_THEME="kolo"
#ZSH_THEME="frontcube"
#ZSH_THEME="random"

# primary as of 2018-12-19
# ZSH_THEME="kennethreitz"
# ZSH_THEME="spaceship"


# ZSH_THEME="powerlevel9k/powerlevel9k"
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs virtualenv)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs kubecontext)
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='red'
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"


# rsm: saved and unused powerline configs
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_first_and_last"
#POWERLEVEL9K_SHORTEN_DELIMITER=".."
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
#POWERLEVEL9K_SHORTEN_DELIMETER=""
#POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

setopt autolist
unsetopt menucomplete

# export EDITOR='subl'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
ZSH_CUSTOM=~/.config/oh-my-zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# removed plugins for speed and based on how often they're used. Add them back in if needed
#   doctl virtualenv docker-compose
plugins=(git docker)

# User configuration

# rsm: working
# digital ocean / doctl
# source $(doctl completion zsh)

#
# PATH ADDITIONS
#

# homebrew path additions
export PATH=/opt/homebrew/bin:/usr/local/bin:$PATH
export PATH=$PATH:"/Applications/Sublime Text.app/Contents/SharedSupport/bin"

# add Golang to the path
export PATH=$PATH:$(go env GOPATH)/bin

#
# NVM
#
# export NVM_DIR="$HOME/.nvm"

# the next two lines load nvm. if you want to not do this and only load nvm on demand, comment these out
# and uncomment the next set of lines that puts that in an alias so you can run it on-demand and also sets
# a default node version from nvm so there's something there no matter what.
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# set up aliases for NVM so for most of the time when we don't need nvm, our shell loads faster
# alias loadnvm='[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"'
# load a default node so we have something when we don't have nvm loaded
export PATH="$PATH:/Users/mitch/.nvm/versions/node/v18.17.1/bin"
# alias setnpmbin=PATH='$PATH:$(npm config get prefix)/bin'

# add yarn to the path - we install via the following command from the yarn website because
# homebrew installs node as well, and that means we *have* to load nvm (slow!) in order not to use
# that version of node, which is silly.
# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# rsm: commenting this out for now - not sure we need it
# export PATH="$PATH:/Users/mitch/.rbenv/shims:/usr/sbin:/sbin:/Applications/Postgres.app/Contents/Versions/9.4/bin"
# export MANPATH="/usr/local/man:$MANPATH"


# rsm: zsh completion scripts installed via Homebrew
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

source $ZSH/oh-my-zsh.sh

# rsm: took this out 2022-02-01 because it really slows down shell startup time
# pipenv completion
# eval "$(pipenv --completion)"

# rsm: working
# bash-completion / bash_completion
# source $(brew --prefix)/etc/bash_completion

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias bfg="java -jar /Users/mitch/Dev/mitch-stuff/basic-tools/bfg-1.14.0.jar"
alias vi='nvim'
alias vim='nvim'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias h='history'
alias cf='codefresh'
alias lg='lazygit'
alias k='kubectl'

# thefuck
# eval "$(thefuck --alias)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mitch/Dev/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/mitch/Dev/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mitch/Dev/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/mitch/Dev/google-cloud-sdk/completion.zsh.inc'; fi


# rsm: aliases
alias setminikubedocker='eval $(minikube docker-env)'
alias unsetminikubedocker='eval "$(docker-machine env -u)"'

# flutter
export PATH="$PATH:$HOME/dev/flutter/bin"

# starship
eval "$(starship init zsh)"


##### nvm (node version manager) #####
# placeholder nvm shell function
# On first use, it will set nvm up properly which will replace the `nvm`
# shell function with the real one
nvm() {
  if [[ -d "$HOME/.nvm" ]]; then
    NVM_DIR="$HOME/.nvm"
    export NVM_DIR
    # shellcheck disable=SC1090
    source "${NVM_DIR}/nvm.sh"
    if [[ -e ~/.nvm/alias/default ]]; then
      PATH="${PATH}:${HOME}/.nvm/versions/node/$(cat ~/.nvm/alias/default)/bin"
    fi
    # invoke the real nvm function now
    nvm "$@"
  else
    echo "nvm is not installed" >&2
    return 1
  fi
}

