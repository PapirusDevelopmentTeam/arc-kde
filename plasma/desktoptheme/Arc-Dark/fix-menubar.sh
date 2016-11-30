#!/usr/bin/env bash
sed -i 's|2f343f|383c4a|g' /usr/share/themes/Arc-Dark/gtk-2.0/menubar-toolbar/menubar-toolbar-dark.rc
sed -i 's|2f343f|383c4a|g' /usr/share/themes/Arc-Dark/gtk-3.0/gtk.css
mogrify +level-colors "#383c4a" /usr/share/themes/Arc-Dark/gtk-2.0/menubar-toolbar/menubar-dark.png
