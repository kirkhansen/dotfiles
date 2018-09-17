RED="\033[02;31m"
YELLOW="\033[02;33m"
GREEN="\033[02;32m"
OCHRE="\033[38;5;95m"
BLUE="\033[02;94m"
WHITE="\033[02;37m"
RESET="\033[0m"

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $GREEN
  else
    echo -e $OCHRE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}

PS1="\[$GREEN\]\u@\h:\[$BLUE\]\w" # username@hostname:working_dir
#PS1+="\[\$(git_color)\]" # color of the git status
#PS1+=" \$(git_branch)" # prints the current branch wrapped in parens
PS1+="\[$BLUE\] \$ \[$RESET\] " # '#' for root, else '$'
export PS1

# vim 4lyfe
export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/vim
set -o vi
