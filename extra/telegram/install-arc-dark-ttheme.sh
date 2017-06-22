#!/bin/sh
echo "Download and Build Telegram theme Arc Dark KDE ..."
mkdir /tmp/Arc-Dark-KDE
cd /tmp/Arc-Dark-KDE
wget https://raw.githubusercontent.com/PapirusDevelopmentTeam/arc-kde/master/extra/telegram/Arc-Dark-KDE/colors.tdesktop-theme
wget https://raw.githubusercontent.com/PapirusDevelopmentTeam/arc-kde/master/extra/telegram/Arc-Dark-KDE/background.jpg
zip -r Arc-Dark-KDE colors.tdesktop-theme background.jpg
mv Arc-Dark-KDE.zip Arc-Dark-KDE.tdesktop-theme
xdg-open /tmp/Arc-Dark-KDE
