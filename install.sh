#!/bin/bash

SCRIPT_PATH=$( command -v /bin/realpath > /dev/null && /bin/realpath "${BASH_SOURCE[0]}" || /bin/readlink -f "${BASH_SOURCE[0]}" )
DOTFILES_PATH="${SCRIPT_PATH%/*}"

_error_message() {
    [ -n "$1" ] && {
        echo "$1" >&2
        command -v /bin/notify-send >/dev/null && notify-send -- "$1"
    }
}

_exit() {
    [ -n "$1" ] && _error_message "$1"
    exit 1
}


install_basrc() {
    DOTFILES_PATH="$DOTFILES_PATH" bash "$DOTFILES_PATH/.config/bash/build" > "$HOME/.bashrc"
    ln -f -s "$DOTFILES_PATH/.config/bash/.bash_profile" "$HOME/.bash_profile"
}

install_xprofile() {
    DOTFILES_PATH="$DOTFILES_PATH" bash "$DOTFILES_PATH/.config/xprofile/build" > "$HOME/.xprofile"
}

install_vim() {
    ln -s -f -T "$DOTFILES_PATH/.config/vim" "${HOME}/.vim"
}

install_ctags() {
    ln -s -f "$DOTFILES_PATH/.ctags" "${HOME}/.ctags"
}

install_i3() {
    I3_CONFIG_PATH="$HOME/.config/i3/config"
    mkdir -p "${I3_CONFIG_PATH%/*}"
    DOTFILES_PATH="$DOTFILES_PATH" bash "$DOTFILES_PATH/.config/i3/build" > "$I3_CONFIG_PATH"
}

install_polybar() {
    ln -s -f -T "$DOTFILES_PATH/.config/polybar" "${HOME}/.config/polybar"
}

install_tmux() {
    TMUX_CONFIG_PATH="$HOME/.config/tmux/tmux.conf"
    mkdir -p "${TMUX_CONFIG_PATH%/*}"
    DOTFILES_PATH="$DOTFILES_PATH" bash "$DOTFILES_PATH/.config/tmux/build" > "$TMUX_CONFIG_PATH"
}

install_rofi() {
    ROFI_CONFIG_PATH="$HOME/.config/rofi"
    mkdir -p "$ROFI_CONFIG_PATH/themes"
    ln -s -f "$DOTFILES_PATH/.config/rofi/themes/nord.rasi" "$ROFI_CONFIG_PATH/themes/nord.rasi"
    ln -s -f "$DOTFILES_PATH/.config/rofi/config.rasi" "$ROFI_CONFIG_PATH/config.rasi"
}

install_wezterm() {
    local INSTALL_PATH="${HOME}/.config/wezterm"
    mkdir -p "${INSTALL_PATH}"
    ln -s -f -T "${DOTFILES_PATH}/.config/wezterm/wezterm.lua" "${INSTALL_PATH}/wezterm.lua"
}

command -v bash >/dev/null && { echo "installing bashrc config."; install_basrc; } || { echo "bash not installed." >&2; }
command -v Xorg >/dev/null && { echo "installing xprofile config."; install_xprofile; } || { echo "xserver not installed." >&2; }
command -v vim >/dev/null && { echo "installing vim config." ; install_vim; } || { echo "vim not installed." >&2; }
command -v ctags >/dev/null && { echo "installing ctags config." ;  install_ctags; } || { echo "ctags not installed." >&2; }
command -v i3 >/dev/null && { echo "installing i3 config." ;  install_i3; } || { echo "i3 not installed." >&2; }
command -v polybar >/dev/null && { echo "installing polybar config." ;  install_polybar; } || { echo "polybar not installed." >&2; }
command -v tmux >/dev/null && { echo "installing tmux config." ;  install_tmux; } || { echo "tmux not installed." >&2; }
command -v rofi >/dev/null && { echo "installing rofi config." ;  install_rofi; } || { echo "rofi not installed." >&2; }
command -v wezterm >/dev/null && { echo "installing wezterm config." ;  install_wezterm; } || _error_message "wezterm not installed."

bash "$DOTFILES_PATH/tools-check.sh"
