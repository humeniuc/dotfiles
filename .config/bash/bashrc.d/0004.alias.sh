# alias pentru xclip
[ $(command -v "xclip" 2>/dev/null) ] && alias xc='xclip -selection clipboard'

[ $(command -v git 2>/dev/null) ] && {
    alias gs="git status"
    alias gf="git fetch"
    alias gprb="git pull --rebase"

    # fzf giff selector
    [ $(command -v fzf 2>/dev/null) ] && alias gf='git status -s| sort| fzf --multi | awk '\''{print $2}'\'
    # fzf giff diff
    [ $(command -v fzf 2>/dev/null) ] && alias gfd='git status -s| sort| fzf --multi | awk '\''{print $2}'\'' | xargs -n1 -I{} git diff {}'
}

alias x1='xargs -n1'

[ $(command -v setsid) ] && [ $(command -v xdg-open) ] && alias xo='setsid xdg-open'
