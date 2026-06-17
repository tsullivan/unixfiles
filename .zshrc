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
plugins=(git docker-compose tmux zsh-syntax-highlighting zsh-history-substring-search)

# Git prompt custom theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Init oh-my-zsh
source $ZSH/oh-my-zsh.sh

# order of these matters



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

bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word

# FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--no-height --reverse --border'
export FZF_TMUX=1
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Cool Shiz
alias rgn="rg -n"
dateIso8601() {
  date +"%Y-%m-%dT%H:%M:%S%z"
}

glrrv() {
  local base="${1:-main}"
  local branch behind ahead changed_files
  branch=$(git rev-parse --abbrev-ref HEAD) || return
  IFS=$'\t' read -r behind ahead < <(git rev-list --left-right --count "$base"...HEAD) || return
  changed_files=$(git diff --name-only "$base"...HEAD | wc -l | tr -d ' ')
  echo "${branch} is ${ahead} ahead, ${behind} behind ${base}, ${changed_files} files changed"
}

# Get the PR link for the current branch
ghshowpr() {
  local link=$(gh pr view --json url --template '{{.url}}' 2>/dev/null)
  
  if [ -n "$link" ]; then
    echo "$link"
    # Optional: Copy to clipboard (macOS)
    # echo "$link" | pbcopy && echo " (Copied to clipboard)"
  else
    echo "No PR found for the current branch."
    return 1
  fi
}

# env vars for applications
source ~/.env.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.local/bin:$PATH"

# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi
#
#
