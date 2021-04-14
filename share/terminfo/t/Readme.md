Există posibilitatea pe sistemele vechi să nu știe de terminal capabilities pentru tmux.

Exemplu de eroare:
```
Unknown terminal: tmux-256color
Check the TERM environment variable.
Also make sure that the terminal is defined in the terminfo database.
Alternatively, set the TERMCAP environment variable to the desired
termcap entry.
```

De aici <https://unix.stackexchange.com/questions/574669/clearing-tmux-terminal-throws-error-tmux-256color-unknown-terminal-type>:

a. Folosește `set -g default-terminal 'screen-256color'` în `.tmux.conf`. `screen` este vechi și reliable, dar am înțeles că are limitări (gen font italic?) dar neimportante.
b. Instalează term capabilities pentru 'tmux-256color':
   1. Obține un terminfo capabilities:
      -  Dintr-un sistem care știe tmux-256color: `infocmp -x tmux-256color > tmux-256color.conf`.
      -  Sau downloadat de la <https://gist.github.com/nicm/ea9cf3c93f22e0246ec858122d9abea1>.
   2. Instalează cu `tic -x tmux-256color.conf`.
