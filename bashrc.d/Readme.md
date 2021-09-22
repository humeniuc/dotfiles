Scripturile bashrc

- Se prefixează numeric pentru a fi încărcate în ordine.
- Se execută doar scripturile sufixate cu ".sh".
- Scripturile dezactivate se sufixează cu ".sh.off". 
- Fișierele "locale", care nu trebuie să ajungă în git este preferabil să fie sufixate cu ".local.sh".
- Pentru a-l activa se face symlink/copiaza scriptul cu ".sh.off" în ".sh", sau, preferabil, în ".local.sh"

Structurare
1-99 scripturi de "sistem": Prompt, functions, aliases.
100-999 librarii externe: z.sh
1000-... librării locale

