[ -r /etc/profile ] && source /etc/profile

export PATH="$(find -L "${HOME}/.local/bin" -type d -print0 | sed "s/\x0$//; s/\x0/:/g"):$PATH"
