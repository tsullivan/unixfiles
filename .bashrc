if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# env
export INPUTRC=~/.inputrc
export PATH=~/bin:/usr/local/bin:$PATH

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -s "/Users/tsullivan/.jabba/jabba.sh" ] && source "/Users/tsullivan/.jabba/jabba.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/tsullivan/.sdkman"
[[ -s "/Users/tsullivan/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/tsullivan/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
