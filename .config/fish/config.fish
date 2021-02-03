# export some path vars
set -x PATH $PATH /home/hansenki/.pyenv/bin/ /usr/local/bin/
set -x DOTNET_CLI_TELEMETRY_OPTOUT 1
set -x GDAL_DATA /usr/share/gdal/

fish_vi_key_bindings

# Re-enable control-f for accepting autocomplete
bind -M insert \cf accept-autosuggestion

# Enable pyenv
set PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/bin $PATH
set -x VIRTUAL_ENV_DISABLE_PROMPT 0
status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

# bobthefish theme
set -g theme_color_scheme solarized-dark
set -g theme_nerd_fonts yes


# aliases
alias git-reuse-commit='git commit -C HEAD@{1}'

alias docker-cleanup-volumes='docker volume rm (docker volume ls -qf dangling=true)'
alias docker-cleanup-images='docker rmi (docker images -f "dangling=true" -q)'
alias docker-cleanup-containers='docker rm -v (docker ps -a -q -f status=exited)'

alias pc="proxychains4"

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true

