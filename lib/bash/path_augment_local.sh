# $HOME/.local/bin and its's recursive subdirectories added in $PATH.
# $DOTFILES_PATH/bin and its's recursive subdirectories added in $PATH.
# That way, if I symlink dotfiles/bin to $HOME/.local/bin/dotfiles, the dotfiles/bin executables whould be accesible.
# PATH_AUGMENT_LOCAL prevents re-augment PATH when starting bash from bash or bash > mc or bash > tmux > bash > mc, etc.
function _path_augment_local() {
    if [ ! -z "$PATH_AUGMENT_LOCAL" ]; then
        PATH=":$PATH:"
        PATH="${PATH/:$PATH_AUGMENT_LOCAL:/:}"
        PATH="${PATH#:}"
        PATH="${PATH%:}"
    fi

    PATH_AUGMENT_LOCAL=""
    local SUBPATH

    if [ -d "$HOME/.local/bin" ]; then
        SUBPATH="$(find -L "$HOME/.local/bin" -type d -print0 | sed "s/\x0$//; s/\x0/:/g")"
        PATH_AUGMENT_LOCAL="${PATH_AUGMENT_LOCAL%:}:${SUBPATH%:}"
    fi


    if [ -d "$DOTFILES_PATH/bin" ]; then
        SUBPATH="$(find -L "$DOTFILES_PATH/bin" -type d -print0 | sed "s/\x0$//; s/\x0/:/g")"
        PATH_AUGMENT_LOCAL="${PATH_AUGMENT_LOCAL%:}:${SUBPATH%:}"
    fi

    PATH_AUGMENT_LOCAL="${PATH_AUGMENT_LOCAL#:}"
    PATH_AUGMENT_LOCAL="${PATH_AUGMENT_LOCAL%:}"

    if test ! -z "$PATH_AUGMENT_LOCAL"; then
        PATH="${PATH_AUGMENT_LOCAL}:${PATH}"
    fi

    export PATH
    export PATH_AUGMENT_LOCAL
}

_path_augment_local
