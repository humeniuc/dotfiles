# de aici
# http://www.etalabs.net/sh_tricks.html
# quoted=$(quote "$var")
quote () { printf %s\\n "$1" | sed "s/'/'\\\\''/g;1s/^/'/;\$s/\$/'/" ; }

function randomchars {
    tr -dc A-Za-z0-9 </dev/urandom |  head -c $1
}


function isTmux {
    if [ ! -z "$TMUX" ]; then
        echo 1
    else
        echo 0
    fi
}

function isScreen {
    if [ ! -z "$STY" ]; then
        echo 1
    else
        echo 0
    fi
}


function isMultiplexer {
    if [ ! -z "$TMUX" -o ! -z "$STY" ]; then
        echo 1
    else
        echo 0
    fi
}


function tmuxSessionName {
    tmux display-message -p '#S'
}


function tmuxfixenv {
    tmux show-environment | sed -e '/^-/d' -e "s/'/'\\\"/g" -e "s/=\(.*\)/='\\1'/" -e "s/^/export /g"
    eval $(tmux show-environment | sed -e '/^-/d' -e "s/'/'\\\"/g" -e "s/=\(.*\)/='\\1'/" -e "s/^/export /g")
}

function tmuxfixtty {
    # de aici
    # https://unix.stackexchange.com/questions/49886/tmux-status-bar-corrupted-after-catting-a-binary-file-how-to-reset/253369#253369
    stty sane; printf '\033k%s\033\\\033]2;%s\007' "`basename "$SHELL"`" "`uname -n`"; tput reset; tmux refresh
}

function vimq {
    vim -q <( $( fc -ln -1 ) )
    forget
}

function forget() {
   history -d $(expr $(history | tail -n 1 | grep -oP '^ \d+') - 1);
}

