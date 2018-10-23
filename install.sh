#!/bin/sh

set -e

gh_repo="arc-kde"
gh_desc="Arc KDE"

cat <<- EOF



        aaa                          kk   kk   ddddd     eeeeeee
      aa   aa   rr rrrr     ccccc    kk kk     dd   dd   ee
      aaaaaaa   rrr       cc         kkk       dd   dd   eeeee
      aa   aa   rr        cc         kk kk     dd   dd   ee
      aa   aa   rr          ccccc    kk   kk   ddddd     eeeeeee


  $gh_desc
  https://github.com/PapirusDevelopmentTeam/$gh_repo


EOF

: "${PREFIX:=/usr}"
: "${TAG:=master}"
: "${uninstall:=false}"

_msg() {
    echo "=>" "$@" >&2
}

_rm() {
    # removes parent directories if empty
    sudo rm -rf "$1"
    sudo rmdir -p "$(dirname "$1")" 2>/dev/null || true
}

_download() {
    _msg "Getting the latest version from GitHub ..."
    wget -O "$temp_file" \
        "https://github.com/PapirusDevelopmentTeam/$gh_repo/archive/$TAG.tar.gz"
    _msg "Unpacking archive ..."
    tar -xzf "$temp_file" -C "$temp_dir"
}

_uninstall() {
    _msg "Deleting $gh_desc ..."
    _rm "$PREFIX/share/aurorae/themes/Arc"
    _rm "$PREFIX/share/aurorae/themes/Arc-Dark"
    _rm "$PREFIX/share/color-schemes/Arc.colors"
    _rm "$PREFIX/share/color-schemes/ArcDark.colors"
    _rm "$PREFIX/share/konsole/Arc.colorscheme"
    _rm "$PREFIX/share/konsole/ArcDark.colorscheme"
    _rm "$PREFIX/share/konversation/themes/papirus"
    _rm "$PREFIX/share/konversation/themes/papirus-dark"
    _rm "$PREFIX/share/Kvantum/Arc"
    _rm "$PREFIX/share/Kvantum/ArcDark"
    _rm "$PREFIX/share/Kvantum/ArcDarker"
    _rm "$PREFIX/share/plasma/desktoptheme/Arc-Dark"
    _rm "$PREFIX/share/plasma/desktoptheme/Arc-Color"
    _rm "$PREFIX/share/plasma/look-and-feel/com.github.varlesh.arc-dark"
    _rm "$PREFIX/share/wallpapers/Arc"
    _rm "$PREFIX/share/wallpapers/Arc-Dark"
    _rm "$PREFIX/share/yakuake/skins/arc"
    _rm "$PREFIX/share/yakuake/skins/arc-dark"
}

_install() {
    _msg "Installing ..."
    sudo cp -R \
        "$temp_dir/$gh_repo-$TAG/aurorae" \
        "$temp_dir/$gh_repo-$TAG/color-schemes" \
        "$temp_dir/$gh_repo-$TAG/konsole" \
        "$temp_dir/$gh_repo-$TAG/konversation" \
        "$temp_dir/$gh_repo-$TAG/Kvantum" \
        "$temp_dir/$gh_repo-$TAG/plasma" \
        "$temp_dir/$gh_repo-$TAG/wallpapers" \
        "$temp_dir/$gh_repo-$TAG/yakuake" \
        "$PREFIX/share"
}

_cleanup() {
    _msg "Clearing cache ..."
    rm -rf "$temp_file" "$temp_dir" \
        ~/.cache/plasma-svgelements-Arc* \
        ~/.cache/plasma_theme_Arc*.kcache
    _msg "Done!"
}

trap _cleanup EXIT HUP INT TERM

temp_file="$(mktemp -u)"
temp_dir="$(mktemp -d)"

if [ "$uninstall" = "false" ]; then
    _download
    _uninstall
    _install
else
    _uninstall
fi
