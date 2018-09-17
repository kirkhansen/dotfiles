#!/bin/bash

ssh_add () {
    ssh-add $1 > /dev/null 2>&1
}

ssh_add ~/.ssh/id_rsa
