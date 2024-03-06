function __ps1_git()
{
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo "($branch) "
    else
        echo ""
    fi;
}

#PS1='[\u@\h \W]\$ ' # default
export PS1=\
'\u@\h \[\033[38;2;102;0;204m\]\w'\
'\n'\
'\[\033[38;2;0;111;184m\]$( declare -F __ps1_git &>/dev/null && __ps1_git )\[\033[00m\]'\
'\[\033[38;2;0;128;128m\]▶\[\033[00m\] '

