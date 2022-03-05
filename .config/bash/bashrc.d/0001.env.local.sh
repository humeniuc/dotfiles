# TMUX_SESSIONIZER_PATHS="$HOME
# $HOME/dotfiles
# $HOME/GoogleDrive/resurse/hear
# $HOME/Dropbox/Desktop/notes";

# TMUX_SESSIONIZER_PATHS="$TMUX_SESSIONIZER_PATHS"$'\n'$(find "$HOME/work/project" -maxdepth 1 -mindepth 1 -type d)

# export TMUX_SESSIONIZER_PATHS

# For non-virtual consoles export COLORTERM. Required by mc + nord skin
[ "$XDG_SESSION_TYPE" = "x11" ] && export COLORTERM=truecolor
