# Custom additions:
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search
# git clone https://github.com/olivierverdier/zsh-git-prompt.git .zsh/git-prompt

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Use case-sensitive completion.
CASE_SENSITIVE="true"

# Plugins
plugins=(git node)

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

# Homebrew
export PATH="/usr/local/opt/curl/bin:$PATH"

# Go
export GOPATH="$HOME/work"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

# Aliases
alias x=gitx
alias larth="ls -larth"

# Zooom around
alias kbn="cd ~/code/kibana"
alias xpk="cd ~/code/x-pack-kibana"
alias xpe="cd ~/code/elasticsearch-extra/x-pack-elasticsearch"
alias es="cd ~/code/elasticsearch"
alias scr="cd ~/scripts"

# Dumb things
alias gitsync='git fetch upstream && git pull --rebase upstream $(git_current_branch)'
alias prunestall="trash node_modules && git clean -fxd node_modules && npm install"

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

# env vars for applications
source ~/.env.sh

# NVM / AVN
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

# FZF
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export FZF_TMUX=1
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/tsullivan/.sdkman"
[[ -s "/Users/tsullivan/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/tsullivan/.sdkman/bin/sdkman-init.sh"
