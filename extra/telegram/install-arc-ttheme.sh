#!/bin/sh
echo "Download and Build Telegram theme Arc KDE ..."
mkdir /tmp/Arc-KDE
cd /tmp/Arc-KDE
wget https://raw.githubusercontent.com/PapirusDevelopmentTeam/arc-kde/master/extra/telegram/Arc-KDE/colors.tdesktop-theme
wget https://raw.githubusercontent.com/PapirusDevelopmentTeam/arc-kde/master/extra/telegram/Arc-KDE/background.jpg
zip -r Arc-KDE colors.tdesktop-theme background.jpg
mv Arc-KDE.zip Arc-KDE.tdesktop-theme
xdg-open /tmp/Arc-KDE
