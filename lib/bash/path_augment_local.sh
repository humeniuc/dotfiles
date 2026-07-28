# Collect directories under $HOME/.local/bin and $DOTFILES_PATH/bin that are
# not already present in the given path string (defaults to $PATH).
# Prints a colon-separated list of new directories.
function _path_augment_local_collect() {
    local path_ref="${1-$PATH}"
    local dir
    local root
    local collected=""

    for root in "$HOME/.local/bin" "$DOTFILES_PATH/bin"; do
        if [ ! -d "$root" ]; then
            continue
        fi

        while IFS= read -r -d '' dir; do
            case ":$path_ref:" in
                *":$dir:"*) ;;
                *)
                    if [ -z "$collected" ]; then
                        collected="$dir"
                    else
                        collected="${collected}:${dir}"
                    fi
                    # Also treat as present for subsequent checks
                    path_ref="${dir}:${path_ref}"
                    ;;
            esac
        done < <(find -L "$root" -type d -print0)
    done

    printf '%s' "$collected"
}

# Prepend collected directories to PATH and export.
function _path_augment_local() {
    local collected
    collected="$(_path_augment_local_collect)"

    if [ -n "$collected" ]; then
        PATH="${collected}:${PATH}"
    fi

    export PATH
}

if [ "${1:-}" = "--augment-path" ]; then
    _path_augment_local
fi
