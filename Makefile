# GNU make is required to run this file. To install on *BSD, run:
#   gmake PREFIX=/usr/local install

PREFIX ?= /usr
IGNORE ?=
THEMES ?= aurorae color-schemes konsole konversation Kvantum plasma wallpapers yakuake

# excludes IGNORE from THEMES list
THEMES := $(filter-out $(IGNORE), $(THEMES))

all:

install:
	mkdir -p $(DESTDIR)$(PREFIX)/share
	cp -R $(THEMES) $(DESTDIR)$(PREFIX)/share

local-install: install
	mkdir -p $(HOME)/.config/Kvantum
	mv $(DESTDIR)$(PREFIX)/share/Kvantum/Arc $(HOME)/.config/Kvantum
	mv $(DESTDIR)$(PREFIX)/share/Kvantum/ArcDark $(HOME)/.config/Kvantum
	mv $(DESTDIR)$(PREFIX)/share/Kvantum/ArcDarker $(HOME)/.config/Kvantum

uninstall:
	-rm -rf $(DESTDIR)$(PREFIX)/share/aurorae/themes/Arc
	-rm -rf $(DESTDIR)$(PREFIX)/share/aurorae/themes/Arc-Dark
	-rm -r  $(DESTDIR)$(PREFIX)/share/color-schemes/Arc.colors
	-rm -r  $(DESTDIR)$(PREFIX)/share/color-schemes/ArcDark.colors
	-rm -r  $(DESTDIR)$(PREFIX)/share/konsole/Arc.colorscheme
	-rm -r  $(DESTDIR)$(PREFIX)/share/konsole/ArcDark.colorscheme
	-rm -rf $(DESTDIR)$(PREFIX)/share/konversation/themes/papirus
	-rm -rf $(DESTDIR)$(PREFIX)/share/konversation/themes/papirus-dark
	-rm -rf $(DESTDIR)$(PREFIX)/share/Kvantum/Arc
	-rm -rf $(DESTDIR)$(PREFIX)/share/Kvantum/ArcDark
	-rm -rf $(DESTDIR)$(PREFIX)/share/Kvantum/ArcDarker
	-rm -rf $(DESTDIR)$(PREFIX)/share/plasma/desktoptheme/Arc-Color
	-rm -rf $(DESTDIR)$(PREFIX)/share/plasma/desktoptheme/Arc-Dark
	-rm -rf $(DESTDIR)$(PREFIX)/share/plasma/look-and-feel/com.github.varlesh.arc-dark
	-rm -rf $(DESTDIR)$(PREFIX)/share/plasma/look-and-feel/com.github.varlesh.arc-darker
	-rm -rf $(DESTDIR)$(PREFIX)/share/plasma/look-and-feel/com.github.varlesh.arc
	-rm -rf $(DESTDIR)$(PREFIX)/share/wallpapers/Arc
	-rm -rf $(DESTDIR)$(PREFIX)/share/wallpapers/Arc-Dark
	-rm -rf $(DESTDIR)$(PREFIX)/share/wallpapers/Arc-Mountains
	-rm -rf $(DESTDIR)$(PREFIX)/share/yakuake/skins/arc
	-rm -rf $(DESTDIR)$(PREFIX)/share/yakuake/skins/arc-dark

local-uninstall: uninstall
	-rm -rf $(HOME)/.config/Kvantum/Arc
	-rm -rf $(HOME)/.config/Kvantum/ArcDark
	-rm -rf $(HOME)/.config/Kvantum/ArcDarker

_get_version:
	$(eval VERSION := $(shell git show -s --format=%cd --date=format:%Y%m%d HEAD))
	@echo $(VERSION)

dist: _get_version
	git archive --format=tar.gz -o $(notdir $(CURDIR))-$(VERSION).tar.gz master -- $(THEMES)

release: _get_version
	git tag -f $(VERSION)
	git push origin
	git push origin --tags

undo_release: _get_version
	-git tag -d $(VERSION)
	-git push --delete origin $(VERSION)


.PHONY: all install local-install uninstall local-uninstall _get_version dist release undo_release

# .BEGIN is ignored by GNU make so we can use it as a guard
.BEGIN:
	@head -3 Makefile
	@false
