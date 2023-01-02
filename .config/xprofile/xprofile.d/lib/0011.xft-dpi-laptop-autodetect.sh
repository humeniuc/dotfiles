# Detecție DPI
# Implicit DPI=144 (pentru 2 monitoare, dintre care unul de 4k este ok)
# Dacă sunt pe monitorul laptopului, atunci DPI=120
DPI=144
MONITORS=$(xrandr --query | grep -w connected)
if [ $( wc -l < <( echo "$MONITORS" ) ) -eq 1 ] && [ $( awk '{print $1}' < <( echo "$MONITORS" ) ) == 'eDP1' ]; then
    DPI=120
fi

xrdb -global -merge <( echo "Xft.dpi: $DPI" )
