if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# env
export INPUTRC=~/.inputrc
export PATH=~/bin:/usr/local/bin:$PATH

# alias
alias docker_run_mysql_container='docker ps -a && docker start 29cbb5374283'
