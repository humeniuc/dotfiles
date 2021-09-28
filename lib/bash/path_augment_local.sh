# $HOME/.local/bin and its's recursive subdirectories added in $PATH.
# That way, if I symlink dotfiles/bin to $HOME/.local/bin/dotfiles, the dotfiles/bin executables whould be accesible.
# PATH_AUGMENT_LOCAL prevents re-augment PATH when starting bash from bash or bash > mc or bash > tmux > bash > mc, etc. 
function _path_augment_local() {
    echo "$PATH"
    PATH="${PATH/$PATH_AUGMENT_LOCAL/}"
    
    if [ -d "${HOME}/.local/bin" ]; then
        PATH_AUGMENT_LOCAL="$(find -L "${HOME}/.local/bin" -type d -print0 | sed "s/\x0$//; s/\x0/:/g")"
        PATH="${PATH_AUGMENT_LOCAL}:${PATH}"
    else
        PATH_AUGMENT_LOCAL=""
    fi

    export PATH
    export PATH_AUGMENT_LOCAL
}

[ -z "$PATH_AUGMENT_LOCAL" ] && _path_augment_local 
