if [[ -e "${HOME}/.bash_utils" ]];
then
     source "${HOME}/.bash_utils"
else
    echo -e "\e[31mbash_utils not found\e[0m" >&2
fi


function vimServerName {
    if isTmux;
    then
        echo "VIM_TMUXSESSION_"$(tmuxSessionName)
    else
        echo "VIM"
    fi
}


function ensureVim {
    echo " ensureVim "
    echo $(vimServerName)
    exists=$(vim --serverlist | grep $(vimServerName))

    if [ -z "$exists" ]; then
        echo 'vim server does not exists'
        if isTmux; then

        else
        fi

    else
        echo 'vim server exists'
    fi
}


function v {
    isTmux && echo "is tmux"
    ensureVim

}

v
