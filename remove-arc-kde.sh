#!/bin/sh

set -e

gh_repo="arc-kde"
gh_desc="Arc KDE customization"

cat <<- EOF

    AA  RRRR   CCC     K  K DDD  EEEE 
   A  A R   R C        K K  D  D E    
   AAAA RRRR  C        KK   D  D EEE  
   A  A R R   C        K K  D  D E    
   A  A R  RR  CCC     K  K DDD  EEEE
   
  $gh_desc
  https://github.com/PapirusDevelopmentTeam/$gh_repo


EOF

echo "=> Removing $gh_desc ..."
rm -rf ~/.local/share/aurorae/themes/Arc
rm -rf ~/.local/share/aurorae/themes/Arc-Dark
rm -rf ~/.local/share/aurorae/themes/Arc-Transparent
rm -rf ~/.local/share/aurorae/themes/Arc-Dark-Transparent
rm -f ~/.local/share/color-schemes/Arc.colors
rm -f ~/.local/share/color-schemes/ArcDark.colors
rm -f ~/.local/share/konsole/Arc.colorscheme
rm -f ~/.local/share/konsole/ArcDark.colorscheme
rm -rf ~/.config/Kvantum/Arc
rm -rf ~/.config/Kvantum/ArcDark
rm -rf ~/.config/Kvantum/ArcDarkTransparent
rm -rf ~/.config/Kvantum/ArcTransparent
rm -rf ~/.local/share/plasma/desktoptheme/Arc-Dark
rm -rf ~/.local/share/plasma/look-and-feel/com.github.varlesh.arc-dark
rm -rf ~/.local/share/wallpapers/Arc
rm -rf ~/.local/share/wallpapers/Arc-Dark
rm -rf ~/.local/share/yakuake/kns_skins/arc
rm -rf ~/.local/share/yakuake/kns_skins/arc-dark
# Clean up
rm -f ~/.cache/plasma-svgelements-Arc-Dark*
rm -f ~/.cache/plasma_theme_Arc-Dark.kcache
echo "=> Done!"
