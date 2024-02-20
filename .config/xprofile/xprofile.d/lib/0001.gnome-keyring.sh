# gnome-keyring already started
# <https://wiki.archlinux.org/title/GNOME/Keyring#gcr-ssh-agent>
if [ -S "${XDG_RUNTIME_DIR}/gcr/ssh" ]; then
    export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gcr/ssh"
# TODO: check gnome-keyring-daemon, ssh-agent started by systemd --user
# manual start
else
    eval $(/usr/bin/gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
    export SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass
fi
