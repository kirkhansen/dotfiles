#### Much better psql output.#####
export YELLOW=`echo -e '\033[02;33m'`
export LIGHT_BLUE=`echo -e '\033[02;94m'`
export NOCOLOR=`echo -e '\033[00m'`
export CYAN=`echo -e '\033[0;36m'`

PAGER="sed \"s/\([[:space:]]\+[0-9.\-]\+\)$/${LIGHT_BLUE}\1$NOCOLOR/;" 
PAGER+="s/\([[:space:]]\+[0-9.\-]\+[[:space:]]\)/${LIGHT_BLUE}\1$NOCOLOR/g;" 
PAGER+="s/\([a-fA-F0-9]\{8\}\-[a-fA-F0-9]\{4\}\-[a-fA-F0-9]\{4\}\-[a-fA-F0-9]\{4\}\-[a-fA-F0-9]\{12\}\)/${CYAN}\1$NOCOLOR/g;"
PAGER+="s/|/$YELLOW|$NOCOLOR/g;s/^\([-+]\+\)/$YELLOW\1$NOCOLOR/\" 2>/dev/null | less"

# Don't change less globally... only when we connect to psql
alias psql="PAGER='$PAGER' LESS='-iMSx4 -FXR' psql"
