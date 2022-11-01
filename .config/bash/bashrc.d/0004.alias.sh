alias x1='xargs -n1'
alias ll='ls -Alt'

[ $(command -v 'setsid') ] && [ $(command -v 'xdg-open') ] && alias xo='setsid xdg-open'

# alias pentru xclip
[ $(command -v 'xclip' 2>/dev/null) ] && alias xc='xclip -selection clipboard'

[ $(command -v git 2>/dev/null) ] && {
    alias gs='git status'
    alias gf='git fetch'
    alias gprb='git pull --rebase'
    alias gpo='git pull origin'

    # fzf giff selector
    [ $(command -v fzf 2>/dev/null) ] && alias gfs='git status -s| sort| fzf --multi | awk '\''{print $2}'\'
    # fzf giff diff
    [ $(command -v fzf 2>/dev/null) ] && alias gfd='gfs | xargs -I{} git diff {}'
}
