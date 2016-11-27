#  Firefox Arc Dark Theme for Arc Dark KDE
Recommends use [Arc Dark Theme](https://github.com/horst3180/arc-firefox-theme) with little fix background color on tabbar

![Screenshot](fix-toolbar.png)

# Install
```
git clone https://github.com/horst3180/arc-firefox-theme.git
cd arc-firefox-theme
sed -i 's|#2f343f|#383c4a|g' arc-firefox-theme/chrome/browser/sass/browser-dark.css
./autogen.sh --prefix=/usr --disable-light --disable-darker
make mkxpi
firefox arc-dark*xpi
```
