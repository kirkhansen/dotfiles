function pipx
    proxychains4 -q pip install $argv | lolcat --spread=100 --freq=0.08 --seed=100 2> /dev/null
end
