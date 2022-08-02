# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Custom additions:
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search
# git clone https://github.com/olivierverdier/zsh-git-prompt.git .zsh/git-prompt

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export CASE_SENSITIVE=true # Use case-sensitive completion.


# Plugins
plugins=(git docker-compose)

# Git prompt custom theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Init oh-my-zsh
source $ZSH/oh-my-zsh.sh

# order of these matters

source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh


autoload -U +X compinit && compinit
autoload -U +X promptinit && promptinit

# Environment variables
export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
export PATH="$PATH"
export MANPATH="/usr/local/man:$MANPATH"
export WORDCHARS="*?_[]~&;:!#$%^(){}<>"
export MANPAGER=/usr/bin/less
export PAGER=cat
# export SSH_KEY_PATH="~/.ssh/id_rsa"

# Those who do not remember history are doomed to repeat it
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTFILE=$HOME/.history
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_verify            # show command with history expansion to user before running it

# GVM/Go
export GOROOT="$HOME/.gvm/versions/go1.9.2.darwin.amd64"
export GOPATH=$HOME/code/go

# Prompt
LSCOLORS=ExFxBxDxCxegedabagacad


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

# FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--no-height --reverse --border'
export FZF_TMUX=1
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f ~/.google-cloud-sdk/path.zsh.inc ]; then . ~/.google-cloud-sdk/path.zsh.inc; fi

# The next line enables shell command completion for gcloud.
if [ -f ~/.google-cloud-sdk/completion.zsh.inc ]; then . ~/.google-cloud-sdk/completion.zsh.inc; fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s ~/.nvm/nvm.sh ] && \. ~/.nvm/nvm.sh  # This loads nvm

# env vars for applications
source ~/.env.sh
