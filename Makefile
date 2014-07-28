GIT := $(shell which git)
FONTFORGE := $(shell which fontforge)

BASE := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PATH_DIST := $(BASE)/dist
PATH_SRC := $(BASE)/src
PATH_TMP := $(BASE)/tmp

.PHONY: all
all: support build

# Support commands
support: prepare-src update-framework dependencies-install

update-framework:
ifeq (,$(GIT))
	@echo "update-framework: It seems that you don't have git on this computer... Its a must!!";
else
	@$(GIT) remote | grep framework > /dev/null || $(GIT) remote add framework https://github.com/findhit/font-framework.git;
	@$(GIT) fetch framework;
	@$(GIT) rebase framework/master;
endif

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
	mkdir -p $(PATH_SRC)/example/sans-serif/regular/2/glyphs
	mkdir -p $(PATH_SRC)/example/sans-serif/regular/4/glyphs
	mkdir -p $(PATH_SRC)/example/sans-serif/regular/7/glyphs
	mkdir -p $(PATH_SRC)/example/sans-serif/italic/2/glyphs
	mkdir -p $(PATH_SRC)/example/sans-serif/italic/4/glyphs
	mkdir -p $(PATH_SRC)/example/sans-serif/italic/7/glyphs
	mkdir -p $(PATH_SRC)/example/serif/regular/2/glyphs
	mkdir -p $(PATH_SRC)/example/serif/regular/4/glyphs
	mkdir -p $(PATH_SRC)/example/serif/regular/7/glyphs

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
build: check build-font build-webfont
build-font: prepare-dist build-font-svg build-font-ttf build-font-eot build-font-otf build-font-woff
build-webfont: prepare-dist build-webfont-eot build-webfont-svg build-webfont-ttf build-webfont-otf build-webfont-woff

built-tmp-fonts: prepare-src
	@echo "Generating fonts:";

	-@rm -fR $(PATH_TMP)/
	@mkdir -p $(PATH_TMP)/

	@for FAMILY in `ls "$(PATH_SRC)"`; do \
		PATH_FAMILY="$(PATH_SRC)/$$FAMILY"; \
		for MEMBER in `ls "$$PATH_FAMILY"`; do \
			PATH_MEMBER="$$PATH_FAMILY/$$MEMBER"; \
			for TYPE in `ls "$$PATH_MEMBER"`; do \
				PATH_TYPE="$$PATH_MEMBER/$$TYPE"; \
		 		for WEIGHT in `ls "$$PATH_TYPE"`; do \
		 			PATH_WEIGHT="$$PATH_TYPE/$$WEIGHT"; \
		 			WEIGHT="$${WEIGHT}00"; \
		 			PATH_FONT="$(PATH_TMP)/$${FAMILY}-$${MEMBER}-$${TYPE}-$${WEIGHT}.sfdir"; \
		 			[ -f "$${PATH_FONT}" ] && rm -fR "$${PATH_FONT}"; \
		 			\
		 			echo " - $${FAMILY} $${MEMBER} $${TYPE} $${WEIGHT}"; \
		 			\
		 			CMDS="New()\n"; \
		 			CMDS+="SetFontNames(\"$$MEMBER\", \"$$FAMILY\", \"$$FAMILY $$MEMBER $$TYPE\", \"$$WEIGHT\")\n"; \
		 			for GLYPH in `ls "$$PATH_WEIGHT/glyphs"`; do \
		 				PATH_GLYPH="$$PATH_WEIGHT/glyphs/$$GLYPH"; \
		 				UNICODE="`echo $$GLYPH | tr -d .svg`"; \
		 				CMDS+="Select( \"$$UNICODE\" )\n"; \
		 				CMDS+="Import( \"$$PATH_GLYPH\", 16 )\n"; \
		 			done; \
		 			CMDS+="Save(\"$${PATH_FONT}\")\n"; \
		 			echo "$$CMDS" | $(FONTFORGE) > /dev/null; \
		 		done; \
		 	done; \
		 done; \
	done;

# Commands for building ttf font-format
ttf: build-ttf
build-ttf: build-font-ttf build-webfont-ttf
build-font-ttf: built-tmp-fonts
	@echo "Not ready yet... sorry...";


build-webfont-ttf:
	@echo "Not ready yet... sorry...";


# Commands for building eot font-format
eot: build-eot
build-eot: build-font-eot build-webfont-eot
build-font-eot: built-tmp-fonts
	@echo "Not ready yet... sorry...";


build-webfont-eot:
	@echo "Not ready yet... sorry...";


# Commands for building svg font-format
svg: build-svg
build-svg: build-font-svg build-webfont-svg
build-font-svg: built-tmp-fonts
	@echo "Not ready yet... sorry...";


build-webfont-svg:
	@echo "Not ready yet... sorry...";

# Commands for building otf font-format
otf: build-otf
build-otf: build-font-otf build-webfont-otf
build-font-otf: built-tmp-fonts
	@echo "Not ready yet... sorry...";


build-webfont-otf:
	@echo "Not ready yet... sorry...";

# Commands for building woff font-format
woff: build-woff
build-woff: build-font-woff build-webfont-woff
build-font-woff: built-tmp-fonts
	@echo "Not ready yet... sorry...";


build-webfont-woff:
	@echo "Not ready yet... sorry...";

