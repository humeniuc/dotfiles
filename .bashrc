if [[ -e "${HOME}/.bash_utils" ]];
then
     source "${HOME}/.bash_utils"
else
    echo -e "\e[31mbash_utils not found\e[0m" >&2
fi

export EDITOR=vim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# daca nu sunt in tmux sau screen setez terminaul pe xterm-256color
# [ -z "$TMUX" -a -z "$STY" ] && export TERM=xterm-256color
! isMultiplexer && export TERM=xterm-256color

# alias pentru xclip
[[ $(type "xclip" 2>/dev/null) ]] && alias xc='xclip -selection clipboard'

alias ls='ls --color=auto'
alias gvr='gvim --remote'
PS1='[\u@\h \W]\$ '


# posibilitatea de a avea pe langa bashrc-ul generic, din repository, a unui bashrc local
if [ -f ~/.bashrc_local ]
then
    bash ~/.bashrc_local
fi

# Enable programmable sdb completion features.
if [ -f ~/.sdb/.sdb-completion.bash ]; then
 source ~/.sdb/.sdb-completion.bash
fi
