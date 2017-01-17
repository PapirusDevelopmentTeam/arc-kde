all:

install:
	mkdir -p $(DESTDIR)/usr/share
	cp --no-preserve=mode,ownership -r \
		aurorae \
		color-schemes \
		konsole \
		konversation \
		Kvantum \
		plasma \
		wallpapers \
		$(DESTDIR)/usr/share
	mkdir -p $(DESTDIR)/usr/share/yakuake/skins
	cp --no-preserve=mode,ownership -r \
		yakuake/kns_skins/arc \
		yakuake/kns_skins/arc-dark \
		$(DESTDIR)/usr/share/yakuake/skins

uninstall:
	-rm -rf $(DESTDIR)/usr/share/aurorae/themes/Arc
	-rm -rf $(DESTDIR)/usr/share/aurorae/themes/Arc-Dark
	-rm -rf $(DESTDIR)/usr/share/aurorae/themes/Arc-Dark-Transparent
	-rm -rf $(DESTDIR)/usr/share/aurorae/themes/Arc-Transparent
	-rm -r  $(DESTDIR)/usr/share/color-schemes/Arc.colors
	-rm -r  $(DESTDIR)/usr/share/color-schemes/ArcDark.colors
	-rm -r  $(DESTDIR)/usr/share/konsole/Arc.colorscheme
	-rm -r  $(DESTDIR)/usr/share/konsole/ArcDark.colorscheme
	-rm -rf $(DESTDIR)/usr/share/konversation/themes/papirus
	-rm -rf $(DESTDIR)/usr/share/konversation/themes/papirus-dark
	-rm -rf $(DESTDIR)/usr/share/Kvantum/Arc
	-rm -rf $(DESTDIR)/usr/share/Kvantum/ArcDark
	-rm -rf $(DESTDIR)/usr/share/Kvantum/ArcDarkTransparent
	-rm -rf $(DESTDIR)/usr/share/Kvantum/ArcTransparent
	-rm -rf $(DESTDIR)/usr/share/plasma/desktoptheme/Arc-Color
	-rm -rf $(DESTDIR)/usr/share/plasma/desktoptheme/Arc-Dark
	-rm -rf $(DESTDIR)/usr/share/plasma/look-and-feel/com.github.varlesh.arc-dark
	-rm -rf $(DESTDIR)/usr/share/wallpapers/Arc
	-rm -rf $(DESTDIR)/usr/share/wallpapers/Arc-Dark
	-rm -rf $(DESTDIR)/usr/share/yakuake/skins/arc
	-rm -rf $(DESTDIR)/usr/share/yakuake/skins/arc-dark

_get_version:
	$(eval VERSION := $(shell git show -s --format=%cd --date=format:%Y%m%d HEAD))
	@echo $(VERSION)

push:
	git push origin

release: _get_version push
	git tag -f $(VERSION)
	git push origin --tags

undo_release: _get_version
	-git tag -d $(VERSION)
	-git push --delete origin $(VERSION)


.PHONY: all install uninstall _get_version push release undo_release
