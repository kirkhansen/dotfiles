triple ()
{
    xrandr --auto --output eDP-1 --off --right-of DP-2 --output HDMI-1 --left-of DP-3 --rotate left --output DP-3 --left-of DP-2 --primary
}

double ()
{
    xrandr --auto --output eDP-1 --left-of DP-2-1 --primary
} 

single ()
{
    xrandr --auto --output eDP-1 --primary
}

