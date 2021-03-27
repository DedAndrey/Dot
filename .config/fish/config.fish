function f
    fff $argv
    set -q XDG_CACHE_HOME; or set XDG_CACHE_HOME $HOME/.cache
    cd (cat $XDG_CACHE_HOME/fff/.fff_d)
end

# fff
# Show/Hide hidden files on open.
# (Off by default)
export FFF_HIDDEN=1

# Directory color [0-9]
export FFF_COL1=6

# Status background color [0-9]
export FFF_COL2=6

# Text Editor
export EDITOR="vim"

# File Opener
export FFF_OPENER="xdg-open"
