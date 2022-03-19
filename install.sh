#!/bin/bash

SCRIPT_PATH=$( command -v /bin/realpath > /dev/null && /bin/realpath "${BASH_SOURCE[0]}" || /bin/readlink -f "${BASH_SOURCE[0]}" )
DOTFILES_PATH="${SCRIPT_PATH%/*}"

ln -s -f -T "$DOTFILES_PATH/.vim" "${HOME}/.vim"
# ln -s -f "$DOTFILES_PATH/.ctags" "${HOME}/.ctags"

bash "$DOTFILES_PATH/.config/bash/build" "$DOTFILES_PATH" > "$HOME/.bashrc"
bash "$DOTFILES_PATH/.config/xprofile/build" "$DOTFILES_PATH" > "$HOME/.xprofile"

I3_CONFIG_PATH="$HOME/.config/i3/config"
mkdir -p "${I3_CONFIG_PATH%/*}"
bash "$DOTFILES_PATH/.config/i3/build" "$DOTFILES_PATH" > "$I3_CONFIG_PATH"

TMUX_CONFIG_PATH="$HOME/.config/tmux/tmux.conf"
mkdir -p "${TMUX_CONFIG_PATH%/*}"
bash "$DOTFILES_PATH/.config/tmux/build" "$DOTFILES_PATH" > "$TMUX_CONFIG_PATH"

# rofi
ROFI_CONFIG_PATH="$HOME/.config/rofi"
mkdir -p "$ROFI_CONFIG_PATH/themes"
ln -s -f "$DOTFILES_PATH/.config/rofi/themes/nord.rasi" "$ROFI_CONFIG_PATH/themes/nord.rasi"
ln -s -f "$DOTFILES_PATH/.config/rofi/config.rasi" "$ROFI_CONFIG_PATH/config.rasi"
