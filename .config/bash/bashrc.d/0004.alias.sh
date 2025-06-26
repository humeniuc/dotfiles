alias x1='xargs -n1'
alias ll='ls -Alt'
alias ts='$DOTFILES_PATH/bin/tmux-sessionizer/tmux-sessionizer.sh'
alias grepie='grep -i -E'

# [ $(command -v 'setsid') ] && [ $(command -v 'xdg-open') ] && alias xo='setsid xdg-open'

# alias pentru xclip
command -v xclip 2>/dev/null && alias xc='xclip -selection clipboard'

command -v git 2>/dev/null && {
    alias gs='git status'
    alias gf='git fetch'
    alias gprb='git pull --rebase'
    alias gpo='git pull origin'

    # fzf giff selector
    [ $(command -v fzf 2>/dev/null) ] && alias gfs='git status -s| sort| fzf --multi | awk '\''{print $2}'\'
    # fzf giff diff
    [ $(command -v fzf 2>/dev/null) ] && alias gfd='gfs | xargs -I{} git diff {}'
}

# Alias pentru i3wm-dxg-open cu workspace-ul precompletat
command -v i3-msg 2>/dev/null && command -v xdg-open 2>/dev/null && {
    alias xo1="${DOTFILES_PATH}/bin/i3wm-xdg-open 1 "
    alias xo2="${DOTFILES_PATH}/bin/i3wm-xdg-open 2 "
    alias xo3="${DOTFILES_PATH}/bin/i3wm-xdg-open 3 "
    alias xo4="${DOTFILES_PATH}/bin/i3wm-xdg-open 4 "
    alias xo5="${DOTFILES_PATH}/bin/i3wm-xdg-open 5 "
    alias xo6="${DOTFILES_PATH}/bin/i3wm-xdg-open 6 "
    alias xo7="${DOTFILES_PATH}/bin/i3wm-xdg-open 7 "
    alias xo8="${DOTFILES_PATH}/bin/i3wm-xdg-open 8 "
    alias xo9="${DOTFILES_PATH}/bin/i3wm-xdg-open 9 "
} 

command -v i3-msg 2>/dev/null && {
    alias ,i1="${DOTFILES_PATH}/bin/i3wm-workspace-cmd 1 "
    alias ,i2="${DOTFILES_PATH}/bin/i3wm-workspace-cmd 2 "
    alias ,i3="${DOTFILES_PATH}/bin/i3wm-workspace-cmd 3 "
    alias ,i4="${DOTFILES_PATH}/bin/i3wm-workspace-cmd 4 "
    alias ,i5="${DOTFILES_PATH}/bin/i3wm-workspace-cmd 5 "
    alias ,i6="${DOTFILES_PATH}/bin/i3wm-workspace-cmd 6 "
    alias ,i7="${DOTFILES_PATH}/bin/i3wm-workspace-cmd 7 "
    alias ,i8="${DOTFILES_PATH}/bin/i3wm-workspace-cmd 8 "
    alias ,i9="${DOTFILES_PATH}/bin/i3wm-workspace-cmd 9 "
}

[ -n "$TMUX" ] && alias ,cd_tmux_session_path='cd $( tmux run-shell '\''printf "%q" "#{session_path}"'\'' )'
