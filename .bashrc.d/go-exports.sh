#!/bin/bash - 
#===============================================================================
#
#          FILE: go-exports.sh
# 
#         USAGE: ./go-exports.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 05/29/2018 11:23
#      REVISION:  ---
#===============================================================================

export GOPATH=${HOME}/.go/
export PATH=${PATH}:/usr/local/go/bin:${GOPATH}/bin

if [ -x "$(command -v jira)" ]; then
    eval "$(jira --completion-script-bash)"
fi
