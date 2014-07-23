
all: support build
.PHONY: all


# Support commands
support: git-upstream-rebase install-dependencies

git-upstream-rebase:
install-dependencies:

# General build commands
build: check build-font build-webfont
build-font: build-font-eot build-font-svg build-font-ttf build-font-otf build-font-woff
build-webfont: build-webfont-eot build-webfont-svg build-webfont-ttf build-webfont-otf build-webfont-woff


# Commands for building eot font-format
eot: build-eot
build-eot: build-font-eot build-webfont-eot
build-font-eot:
build-webfont-eot:


# Commands for building svg font-format
svg: build-svg
build-svg: build-font-svg build-webfont-svg
build-font-svg:
build-webfont-svg:


# Commands for building ttf font-format
ttf: build-ttf
build-ttf: build-font-ttf build-webfont-ttf
build-font-ttf:
build-webfont-ttf:


# Commands for building otf font-format
otf: build-otf
build-otf: build-font-otf build-webfont-otf
build-font-otf:
build-webfont-otf:


# Commands for building woff font-format
woff: build-woff
build-woff: build-font-woff build-webfont-woff
build-font-woff:
build-webfont-woff:


