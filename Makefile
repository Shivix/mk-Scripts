MKBUILD = mkbuild.sh
MKPROJECT = mkproject.sh
MKTEST = mktest.sh
MKCLASS = mkclass.sh
MKHEADER = mkheader.sh
# MANPAGE = $(SCRIPT).6

PREFIX = /usr/local
MKBUILD_DIR = $(PREFIX)/bin/mkbuild
MKPROJECT_DIR = $(PREFIX)/bin/mkproject
MKTEST_DIR = $(PREFIX)/bin/mktest
MKCLASS_DIR = $(PREFIX)/bin/mkclass
MKHEADER_DIR = $(PREFIX)/bin/mkheader
# INSTMAN = $(PREFIX)/share/man/man6

.PHONY: all
all:
	@echo did nothing. try targets: install, or uninstall.

.PHONY: install
install:
	install $(MKBUILD) $(MKBUILD_DIR)
	install $(MKPROJECT) $(MKPROJECT_DIR)
	install $(MKTEST) $(MKTEST_DIR)
	install $(MKCLASS) $(MKCLASS_DIR)
	install $(MKHEADER) $(MKHEADER_DIR)
	# install $(MANPAGE) $(INSTMAN)

.PHONY: uninstall
uninstall:
	$(RM) $(MKBUILD_DIR)
	$(RM) $(MKPROJECT_DIR)
	$(RM) $(MKTEST_DIR)
	$(RM) $(MKCLASS_DIR)
	$(RM) $(MKHEADER_DIR)
	# $(RM) $(INSTMAN)/$(MANPAGE)

