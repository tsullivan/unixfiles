# Custom additions:
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search
# git clone https://github.com/olivierverdier/zsh-git-prompt.git .zsh/git-prompt

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export CASE_SENSITIVE=true # Use case-sensitive completion.


# Plugins
plugins=(git ssh-agent docker-compose)

# Init oh-my-zsh
source $ZSH/oh-my-zsh.sh

# order of these matters

# source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
#
# Init git-prompt
# haskell bin for git prompt
export GIT_PROMPT_EXECUTABLE="haskell"
source ~/.zsh/git-prompt/zshrc.sh

autoload -U +X compinit && compinit
autoload -U +X promptinit && promptinit

# Environment variables
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export MANPATH="/usr/local/man:$MANPATH"
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=$HOME/.history
export WORDCHARS="*?_[]~&;:!#$%^(){}<>"
export MANPAGER=/usr/bin/less
export PAGER=cat
export SSH_KEY_PATH="~/.ssh/id_rsa"

# GVM/Go
export GOROOT="$HOME/.gvm/versions/go1.9.2.darwin.amd64"
export GOPATH=$HOME/code/go

# Prompt
LSCOLORS=ExFxBxDxCxegedabagacad

# Git prompt
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

# PyENV
# [ -s "$HOME/.pyenv.sh" ] && \. "$HOME/.pyenv.sh"  # This loads pyenv

# NVM
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--no-height --reverse --border'
export FZF_TMUX=1
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
