# load up bashrc.d
source <(cat ~/.bashrc.d/*)

export EDITOR=vim

source /etc/bash_completion
# Uncomment once we figure out mfa for jump...
source ~/.bash-git-prompt/gitprompt.sh
source ~/.dredge/autocomplete

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tabtab source for jiractl package
# uninstall by removing these lines or running `tabtab uninstall jiractl`
[ -f /home/hansenki/.nvm/versions/node/v9.1.0/lib/node_modules/@godaddy/jiractl/node_modules/tabtab/.completions/jiractl.bash ] && . /home/hansenki/.nvm/versions/node/v9.1.0/lib/node_modules/@godaddy/jiractl/node_modules/tabtab/.completions/jiractl.bash
