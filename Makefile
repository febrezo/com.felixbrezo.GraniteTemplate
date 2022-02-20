compile_and_run: clean translate
	flatpak-builder build-dir com.felixbrezo.GraniteTemplate.json --force-clean --install --user && flatpak run com.felixbrezo.GraniteTemplate
run:
	flatpak run com.felixbrezo.GraniteTemplate
debug:
	flatpak run --devel --command=sh com.felixbrezo.GraniteTemplate
translate:
	meson build --prefix=/usr
	cd build && ninja com.felixbrezo.GraniteTemplate-pot && ninja com.felixbrezo.GraniteTemplate-update-po
clean:
	rm -rf build-dir build .flatpak-builder
