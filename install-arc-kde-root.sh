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

temp_dir="$(mktemp -d)"

echo "=> Getting the latest version from GitHub ..."
wget -O "/tmp/$gh_repo.tar.gz" \
  https://github.com/PapirusDevelopmentTeam/$gh_repo/archive/master.tar.gz
echo "=> Unpacking archive ..."
tar -xzf "/tmp/$gh_repo.tar.gz" -C "$temp_dir"
echo "=> Deleting old $gh_desc ..."
sudo rm -rf /usr/share/aurorae/themes/Arc
sudo rm -rf /usr/share/aurorae/themes/Arc-Dark
sudo rm -f /usr/share/color-schemes/Arc.colors
sudo rm -f /usr/share/color-schemes/ArcDark.colors
sudo rm -f /usr/share/konsole/Arc.colorscheme
sudo rm -f /usr/share/konsole/ArcDark.colorscheme
sudo rm -rf /usr/share/konversation/themes/papirus
sudo rm -rf /usr/share/konversation/themes/papirus-dark
sudo rm -rf /usr/share/Kvantum/Arc
sudo rm -rf /usr/share/Kvantum/ArcDark
sudo rm -rf /usr/share/Kvantum/ArcDarker
sudo rm -rf /usr/share/plasma/desktoptheme/Arc-Dark
sudo rm -rf /usr/share/plasma/desktoptheme/Arc-Color
sudo rm -rf /usr/share/plasma/look-and-feel/com.github.varlesh.arc-dark
sudo rm -rf /usr/share/wallpapers/Arc
sudo rm -rf /usr/share/wallpapers/Arc-Dark
sudo rm -rf /usr/share/yakuake/skins/arc
sudo rm -rf /usr/share/yakuake/skins/arc-dark
echo "=> Installing ..."
sudo cp -R \
  "$temp_dir/$gh_repo-master/aurorae" \
  "$temp_dir/$gh_repo-master/color-schemes" \
  "$temp_dir/$gh_repo-master/konsole" \
  "$temp_dir/$gh_repo-master/konversation" \
  "$temp_dir/$gh_repo-master/plasma" \
  "$temp_dir/$gh_repo-master/wallpapers" \
  "$temp_dir/$gh_repo-master/Kvantum" \
  "$temp_dir/$gh_repo-master/yakuake" \
  /usr/share/
echo "=> Clearing cache ..."
rm -rf "/tmp/$gh_repo.tar.gz" "$temp_dir" \
  ~/.cache/plasma-svgelements-Arc* \
  ~/.cache/plasma_theme_Arc*.kcache
echo "=> Done!"
