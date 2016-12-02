#!/bin/sh

set -e

gh_repo="arc-kde"
gh_desc="Arc KDE customization"

cat <<- EOF



        aaa                          kk   kk   ddddd     eeeeeee
      aa   aa   rr rrrr     ccccc    kk kk     dd   dd   ee
      aaaaaaa   rrr       cc         kkk       dd   dd   eeeee
      aa   aa   rr        cc         kk kk     dd   dd   ee
      aa   aa   rr          ccccc    kk   kk   ddddd     eeeeeee


  $gh_desc
  https://github.com/PapirusDevelopmentTeam/$gh_repo


EOF

echo "=> Removing $gh_desc ..."
# root
sudo rm -rf /usr/share/aurorae/themes/Arc
sudo rm -rf /usr/share/aurorae/themes/Arc-Dark
sudo rm -rf /usr/share/aurorae/themes/Arc-Transparent
sudo rm -rf /usr/share/aurorae/themes/Arc-Dark-Transparent
sudo rm -f /usr/share/color-schemes/Arc.colors
sudo rm -f /usr/share/color-schemes/ArcDark.colors
sudo rm -f /usr/share/konsole/Arc.colorscheme
sudo rm -f /usr/share/konsole/ArcDark.colorscheme
sudo rm -rf /usr/share/konversation/themes/papirus
sudo rm -rf /usr/share/konversation/themes/papirus-dark
sudo rm -rf /usr/share/Kvantum/Arc
sudo rm -rf /usr/share/Kvantum/ArcDark
sudo rm -rf /usr/share/Kvantum/ArcDarkTransparent
sudo rm -rf /usr/share/Kvantum/ArcTransparent
sudo rm -rf /usr/share/plasma/desktoptheme/Arc-Dark
sudo rm -rf /usr/share/plasma/look-and-feel/com.github.varlesh.arc-dark
sudo rm -rf /usr/share/wallpapers/Arc
sudo rm -rf /usr/share/wallpapers/Arc-Dark
sudo rm -rf /usr/share/yakuake/skins/arc
sudo rm -rf /usr/share/yakuake/skins/arc-dark
# home
rm -rf ~/.local/share/aurorae/themes/Arc
rm -rf ~/.local/share/aurorae/themes/Arc-Dark
rm -rf ~/.local/share/aurorae/themes/Arc-Transparent
rm -rf ~/.local/share/aurorae/themes/Arc-Dark-Transparent
rm -f ~/.local/share/color-schemes/Arc.colors
rm -f ~/.local/share/color-schemes/ArcDark.colors
rm -f ~/.local/share/konsole/Arc.colorscheme
rm -f ~/.local/share/konsole/ArcDark.colorscheme
rm -rf ~/.local/share/konversation/themes/papirus
rm -rf ~/.local/share/konversation/themes/papirus-dark
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
