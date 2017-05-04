if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# env
export INPUTRC=~/.inputrc
export PATH=~/bin:/usr/local/bin:$PATH

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -s "/Users/tsullivan/.jabba/jabba.sh" ] && source "/Users/tsullivan/.jabba/jabba.sh"
