# export some path vars
set -x PATH $PATH /home/hansenki/.pyenv/bin/ /usr/local/bin/
set -x DOTNET_CLI_TELEMETRY_OPTOUT 1

fish_vi_key_bindings

# Re-enable control-f for accepting autocomplete
bind -M insert \cf accept-autosuggestion

# Enable pyenv
status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

# bobthefish theme
set -g theme_color_scheme solarized-dark
set -g theme_nerd_fonts yes


# aliases
alias git-reuse-commit='git commit -C HEAD@{1}'
