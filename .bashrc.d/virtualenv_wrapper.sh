#!/bin/bash - 
#===============================================================================
#
#          FILE: virtualenv_wrapper.sh
# 
#         USAGE: ./virtualenv_wrapper.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 02/08/2017 10:25
#      REVISION:  ---
#===============================================================================

if [[ $(which virtualenvwrapper.sh) ]]; then
    export WORKON_HOME=/home/hansenki/.virtualenvs
    source $(which virtualenvwrapper.sh)
fi
