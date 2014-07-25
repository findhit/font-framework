Font Framework
==============

Font framework is a multi-[family, type and weight] builder to help you on font deploying, making it faster than light!! **@Nelson: Haaa-Haaa @Einstein!!**


## Instalation / How do i build a font?

* Fork this repo and change the name to `font-[SomeCoolName]` (If you're gonna to develop one family, it should be it's name)
* Clone your forked repo on your computer
* Open a terminal on your repo
* When you have your fork on your computer, you should met the dependencies by dooing `make support`
* Since Font Framework is now ready to deploy, you could jump the task of structure preparation by running `make skeleton`, this should create a skeleton structure for you to work on!
* Create your font glyphs on right places
* Run `make build` to get your font files, your builded fonts should be now on `dist/` folder :)


## Why should i use it?

Before all, you only need this Makefile!
This is the framework we use at our headquarters to build and organize our fonts (some of them are open-source, you're welcome to make them better and/or use them).
Major problems on fonts developing are the ammount of configurations that you have to do before developing, this skips that process by detecting what you have to build it right away!


## How does it work?

You can give a peek on some examples [here](#changeme) to learn how to organize your font. If you follow our simple folder/files structure, building the font should be easy as 1,2...3!! If you don't like to peek examples, use our skeleton generator by running `make skeleton`...


### Folder / Files structure

	* **dist/** - this should hold all builded fonts
	* **src/**
		* **[family]/** - Font Family name. Ex: Arial, helvetica, Times New Roman (wow)
			* **[member]/** - Font Family member name. Ex: default, black, sans-serif, serif...
				* **[type]/** - Type of font. Ex: regular, italic, icon...
					* **[weight]/** - Weight of font: 1 to 9, 1 means 100, 2 means 200, and so on...
						* **glyphs/**
							* [unicode]-[name].svg - file with paths for glyph
						* [space reserved for further configuration]
	* README.md - You should replace our README.md with yours, but don't forget credits to **Font Framework**!! :D

### Example structure with 2 families
	
	* dist/ (Builded)
		* font-arial-black-italic-200.ttf
		* font-arial-black-italic-500.otf
		* font-arial-black-italic-800.svg
		* font-helvetica-xpto-regular-200.ttf
		* font-helvetica-xpto-regular-200.woff
		* webfont-arial-black-italic-200.ttf
		* webfont-arial-black-italic-500.otf
		* webfont-arial-black-italic-800.svg
		* webfont-helvetica-xpto-regular-200.ttf
		* webfont-helvetica-xpto-regular-200.woff
	* src/
		* arial/
			* black/
				* italic/
					* 2/
						* glyphs/
							* ...
					* 5/
						* glyphs/
							* ...
					* 8/
						* glyphs/
							* ...
		* helvetica
			* xpto/
				* regular/
					* 2/
						* glyphs/
							* ...
	* README.md


### What are the commands that i could use?

* `make` or `make all`- This does the same as `make support && make magic`
* `make support` - You should run this in case of some error non related with you
* `make skeleton` - This generates a structure for you start working on your font!
* `make check` - This checks and makes sure that everything is right to be built
* `make build` - Builds printing font and web font versions
* `make build-font` - Builds printing font version
* `make build-webfont` - Builds web font version


## Supported font types

* eot
* svg
* ttf
* otf
* woff


## Why thoose?

```
# Font types description kindly available by @[Rich Bradshaw](http://stackoverflow.com/users/16511/rich-bradshaw) on [stackoverflow.com](http://stackoverflow.com/questions/11002820/why-should-we-include-ttf-eot-woff-svg-in-a-font-face)

In short, font-face is very old, but only recently has been supported by more than IE.
eot is needed for Internet Explorers that are older than IE9 - they invented the spec, but eot is a horrible format that strips out much of the font features.
ttf and otf are normal old fonts, but some people got annoyed that this meant anyone could download and use them.
At the same time, iOS on the iPhone and iPad implemented svg fonts.
Then, woff was invented which has a mode that stops people pirating the font. This is the preferred format.
In iOS 5, iOS started to be able to use fonts that aren't SVG, I'm not sure if it supports woff, but I think it does.
If you don't want to support IE 8 and lower, and iOS 4 and lower, and android, then you can just use WOFF.

# Support for woff can be checked at http://caniuse.com/woff
```


## What is the difference between font and webfont?

There are some points that makes a font not only usefull for web but also required too:

* On web, compressed assets are a requirement! The simplest way to compress more is to suppress the less, in other words, you MUST strip everything that you aren't using on a font, **font-framework** doest that for you, everytime you build! :)
* Icons, a long time ago icons were loaded as individual images, thats fine for any developer, but not for persons with slow internet. So someone had the clever idea of trapping all images on one image only and called it `css sprite`, since they were divided by css `background-position`. That was fine too but what about icons with different colours and sizes? And retina displays? Oh man, another sprite and icons? Thats were font-based icons comes in! You could develop a font of icons using **font-framework** too, or use one of the coverted examples... For instance, you could check [FontAwesome](#changeme)

