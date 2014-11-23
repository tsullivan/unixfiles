if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# env
unset HISTFILE
export INPUTRC=~/.inputrc
export PATH=~/bin:/usr/local/bin:$PATH
