# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [[ -e "${HOME}/.bash_utils" ]];
then
     source "${HOME}/.bash_utils"
else
    echo -e "\e[31mbash_utils not found\e[0m" >&2
fi

export PATH=~/dotfiles/bin:$PATH
export EDITOR=vim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# daca nu sunt in tmux sau screen setez terminaul pe xterm-256color
# ! isMultiplexer && export TERM=xterm-256color
if [ "$(isMultiplexer)" == 0 ] ; then
    # de aici https://www.reddit.com/r/vim/comments/4e8wl9/my_vim_setup/d1ycifnk
    if [ $TERM == "xterm" ] ; then
        if [ -n $COLORTERM ] ; then
            if [ $COLORTERM == "gnome-terminal" -o $COLORTERM == "xfce-terminal" -o $COLORTERM == "xfce4-terminal" ] ; then
                export TERM=xterm-256color
            fi
        elif [ -n "$VTE_VERSION" ] ; then
            export TERM=xterm-256color
        fi
    fi
fi

# alias pentru xclip
[[ $(type "xclip" 2>/dev/null) ]] && alias xc='xclip -selection clipboard'

alias ls='ls --color=auto'
alias gvr='gvim --remote'
PS1='[\u@\h \W]\$ '

# posibilitatea de a avea pe langa bashrc-ul generic, din repository, a unui bashrc local
if [ -f ~/.bashrc_local ]
then
    source ~/.bashrc_local
fi

