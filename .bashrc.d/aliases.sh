#!/bin/bash - 
#===============================================================================
#
#          FILE: aliases.sh
# 
#         USAGE: ./aliases.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 02/08/2017 10:33
#      REVISION:  ---
#===============================================================================

alias weather='curl http://wttr.in/~Grimes,IA'
alias py-cleanup="find . -name '*.pyc' -delete"

alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"

alias ls='ls --color=auto'
alias ll='ls --color=auto -lah'

# GIT
alias git-reuse-commit='git commit -C HEAD@{1}'

alias monitor-dd="watch -n5 'sudo kill -USR1 $(pgrep ^dd)'"

alias jira="jira -k"

GIT_LOG_FORMAT="%C(blue)%h  %C(cyan)%ad  %C(reset)%s%C(green)  [%cn] %C(yellow)%d"
alias glog='git log --pretty=format:"$GIT_LOG_FORMAT" --decorate --date=short'
