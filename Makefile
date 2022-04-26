MKBUILD = mkbuild.sh
MKPROJECT = mkproject.sh
MKHEADER = mkheader.sh
# MANPAGE = $(SCRIPT).6

PREFIX = /usr/local
MKBUILD_DIR = $(PREFIX)/bin/mkbuild
MKPROJECT_DIR = $(PREFIX)/bin/mkproject
MKHEADER_DIR = $(PREFIX)/bin/mkheader
# INSTMAN = $(PREFIX)/share/man/man6

.PHONY: all
all:
	@echo did nothing. try targets: install

.PHONY: install
install:
	install $(MKBUILD) $(MKBUILD_DIR)
	install $(MKPROJECT) $(MKPROJECT_DIR)
	install $(MKHEADER) $(MKHEADER_DIR)
	# install $(MANPAGE) $(INSTMAN)

