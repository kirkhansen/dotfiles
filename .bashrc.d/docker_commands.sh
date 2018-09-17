#!/bin/bash - 
alias docker-cleanup-volumes='docker volume rm $(docker volume ls -qf dangling=true)'
alias docker-cleanup-images='docker rmi $(docker images -f "dangling=true" -q)'
alias docker-cleanup-containers='docker rm -v $(docker ps -a -q -f status=exited)'
