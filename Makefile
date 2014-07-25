
PATH := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PATH_DIST := $(PATH)/dist
PATH_SRC := $(PATH)/src

.PHONY: all
all: support build

# Support commands
support: prepare-src git-upstream-rebase dependencies-install

git-upstream-rebase:
	@echo "Not ready yet... sorry...";


dependencies-install:

# Linux
ifeq ($(UNAME_S),Linux)

	# Update packages
	sudo apt-get -y update

	# Install packages
	sudo apt-get -y install fontforge ttfautohint ttf2eot

endif

# Mac OS
ifeq ($(UNAME_S),Darwin)

	# Install brew if not installed
ifeq (,$(shell which brew))
	ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
	brew install ruby
	brew install python
endif

	# Update packages
	brew update

	# Install packages
	brew install fontforge ttfautohint ttf2eot

endif

skeleton:
	# We must drive some changes here yet
	mkdir -p $(PATH_SRC)/example/sans-serif/2/glyphs
	mkdir -p $(PATH_SRC)/example/sans-serif/4/glyphs
	mkdir -p $(PATH_SRC)/example/sans-serif/7/glyphs
	mkdir -p $(PATH_SRC)/example/serif/2/glyphs
	mkdir -p $(PATH_SRC)/example/serif/4/glyphs
	mkdir -p $(PATH_SRC)/example/serif/7/glyphs

	@echo "We've created an example skeleton for you!!";
	@echo "If you want to build it, run: make build";
	@echo "Otherwise, you could clean **src/** folder by running: make clean-src";

# Prepare commands

prepare-src:
	mkdir -p $(PATH_SRC)

prepare-dist:
	mkdir -p $(PATH_DIST)

# Clean things
clean: clean-src clean-dist
clean-src:
	@echo "Heyyy!!! Did you mean that you want to clean all the SOURCES!?!? Are you really sure?? If yes write on upper case [YES I DO]:"
	@read TMP; if [ "$$TMP" == "YES I DO" ]; then \
		rm -fR $(PATH_SRC)/*; \
	fi
clean-dist:
	rm -fR $(PATH_DIST)/*


# Check things
check:
	@echo "Not ready yet... sorry...";


# General build commands
build: clean check build-font build-webfont
build-font: prepare-dist build-font-eot build-font-svg build-font-ttf build-font-otf build-font-woff
build-webfont: prepare-dist build-webfont-eot build-webfont-svg build-webfont-ttf build-webfont-otf build-webfont-woff

# Commands for building eot font-format
eot: build-eot
build-eot: build-font-eot build-webfont-eot
build-font-eot:
	@echo "Not ready yet... sorry...";


build-webfont-eot:
	@echo "Not ready yet... sorry...";


# Commands for building svg font-format
svg: build-svg
build-svg: build-font-svg build-webfont-svg
build-font-svg:
	@echo "Not ready yet... sorry...";


build-webfont-svg:
	@echo "Not ready yet... sorry...";


# Commands for building ttf font-format
ttf: build-ttf
build-ttf: build-font-ttf build-webfont-ttf
build-font-ttf:
	@echo "Not ready yet... sorry...";


build-webfont-ttf:
	@echo "Not ready yet... sorry...";


# Commands for building otf font-format
otf: build-otf
build-otf: build-font-otf build-webfont-otf
build-font-otf:
	@echo "Not ready yet... sorry...";


build-webfont-otf:
	@echo "Not ready yet... sorry...";

# Commands for building woff font-format
woff: build-woff
build-woff: build-font-woff build-webfont-woff
build-font-woff:
	@echo "Not ready yet... sorry...";


build-webfont-woff:
	@echo "Not ready yet... sorry...";

