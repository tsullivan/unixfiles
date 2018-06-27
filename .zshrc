# Custom additions:
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search
# git clone https://github.com/olivierverdier/zsh-git-prompt.git .zsh/git-prompt

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Use case-sensitive completion.
CASE_SENSITIVE="true"

# Plugins
plugins=(git docker docker-compose)

# Init oh-my-zsh
source $ZSH/oh-my-zsh.sh

# order of these matters

# Init git-prompt
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/git-prompt/zshrc.sh

autoload -U +X compinit && compinit
autoload -U +X promptinit && promptinit

# Environment variables
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export MANPATH="/usr/local/man:$MANPATH"
export HISTSIZE=20000
export SAVEHIST=20000
export HISTFILE=$HOME/.history
export WORDCHARS="*?_[]~&;:!#$%^(){}<>"
export MANPAGER=/usr/bin/less
export PAGER=cat
export SSH_KEY_PATH="~/.ssh/id_rsa"
export JAVA_HOME=$(/usr/libexec/java_home)

# GVM/Go
export GOROOT="$HOME/.gvm/versions/go1.9.2.darwin.amd64"
export PATH="$GOROOT/bin:$PATH"
export GOPATH=$HOME/code/go

# Homebrew
export PATH="/usr/local/opt/curl/bin:$PATH"

# Aliases
alias x=gitx
alias larth="ls -larth"

# Dumb things
alias gitsync='git fetch upstream && git pull --rebase upstream $(git_current_branch)'
alias prunestall="trash node_modules && yarn install"

# Prompt
LSCOLORS=ExFxBxDxCxegedabagacad

# Git prompt
ZSH_THEME_GIT_PROMPT_NOCACHE=1 # disable status caching
PROMPT='%~%b$(git_super_status) %# '

# zsh-history-substring-search
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

bindkey -e
bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word

# env vars for applications
source ~/.env.sh

# NVM / AVN
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# FZF
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS='--no-height --reverse --border'
export FZF_TMUX=1
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[ -s "/Users/tsullivan/.jabba/jabba.sh" ] && source "/Users/tsullivan/.jabba/jabba.sh"
