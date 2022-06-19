_show_header() {
    SCRIPT_PATH="$1"
    echo "# Generated from $SCRIPT_PATH"
    echo "# ----------"
    echo ""
}

_export_dotfiles_path() {
    echo "export DOTFILES_PATH=\"$DOTFILES_PATH\""
    echo ""
}

_include_files() {
    DIR="$1"
    EXTENSION="$2"

    for file in "$DIR/"*"$EXTENSION"; do
        if test -r "$file"; then
            echo "# ----------"
            echo "# $file"
            echo "# ----------"
            echo ""
            cat "$file"
            echo ""
        fi
    done
}

