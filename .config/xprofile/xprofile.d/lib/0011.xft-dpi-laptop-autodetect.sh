# Detecție DPI
# Implicit DPI=144 (pentru 2 monitoare, dintre care unul de 4k este ok)
# Dacă sunt pe monitorul laptopului, atunci DPI=120
DPI=144
MONITORS=$(xrandr --query | grep -w connected)

# laptop vechi
if [ $( wc -l < <( echo "$MONITORS" ) ) -eq 1 ] && [ $( awk '{print $1}' < <( echo "$MONITORS" ) ) == 'eDP1' ]; then
    DPI=120
fi

# laptop nou
if [ $( wc -l < <( echo "$MONITORS" ) ) -eq 1 ] && [ $( awk '{print $1}' < <( echo "$MONITORS" ) ) == 'eDP-1' ]; then
    DPI=192
fi

xrdb -global -merge <( echo "Xft.dpi: $DPI" )
xrandr --dpi "$DPI"

command -v wine &>/dev/null && {
    # wine reg add "HKCU\Control Panel\Desktop" /v LogPixels /t REG_DWORD /d "$DPI" /f >/dev/null
}
