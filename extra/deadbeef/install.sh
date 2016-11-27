#/bin/bash
mkdir -p ~/.local/lib/deadbeef
mkdir -p ~/.config/deadbeef
cp config/* ~/.config/deadbeef/
sed -i "s/alex/$USER/g" ~/.config/deadbeef/config
if [ "`uname -m`" != "x86_64" ]; then
    cp lib_x86/*.so ~/.local/lib/deadbeef/
else
    cp lib_x86_64/*.so ~/.local/lib/deadbeef/
fi
notify-send "Pleasant to use :)" "Style installed"
