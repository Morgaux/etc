#
# Main Makefile for linking, generating, and otherwise managing config files.
#
# Must be first non-comment
.POSIX:

VIM_BUNDLE_DIR := ${HOME}/.vim/bundle
BOOK_DIR       := ${HOME}/var/books

PROFILE    := ${HOME}/.profile
KSHRC      := ${HOME}/.kshrc ${HOME}/.mkshrc
ALIASES    := ${HOME}/.aliases
XINITRC    := ${HOME}/.xinitrc ${HOME}/.xsession
XRESOURCES := ${HOME}/.Xresources ${HOME}/.Xdefaults
VIMRC      := ${HOME}/.vimrc
FVWMRC     := ${HOME}/.fvwmrc

VIMBUNDLES := 
BOOKS      := 

all:

# Files needed to generate ${PROFILE}, in the order used.
PROFILE_SNIPPETS := snippets/detect_shell.sh             \
                    snippets/environment.sh              \
                    snippets/*_aliases.sh                \
                    snippets/clean_home.sh               \
                    snippets/git_config.sh               \
                    snippets/git_repositories.sh         \
                    snippets/xdg_directories.sh          \
                    snippets/daemons.sh                  \
                    snippets/auto_commit_vim_spelling.sh \
                    snippets/auto_startx.sh

${PROFILE}: ${PROFILE_SNIPPETS}
	@echo "Generating $@"
	@{                                                                                                \
		echo '#!/bin/sh'                                                                        ; \
		echo ''                                                                                 ; \
		echo '##                                                                            ##' ; \
		echo '#                              !!! IMPORTANT !!!                               #' ; \
		echo '#                                                                              #' ; \
		echo '#                      DO NOT MODIFY - FILE AUTO-GENERATED                     #' ; \
		echo '#                                                                              #' ; \
		echo '#                                                                              #' ; \
		echo '#                            Mi volas vidi morgaux                             #' ; \
		echo '#                                                                              #' ; \
		echo '#                                                                              #' ; \
		echo '##                                                                            ##' ; \
		echo ''                                                                                 ; \
	} | cat - ${PROFILE_SNIPPETS} > ${@:%=%.tmp} # Create new temporary file
	@[ -f $@ ] && cat $@ > ${@:%=%.bak}          # make a back up
	@rm -f $@                                    # remove old file
	@mv ${@:%=%.tmp} $@                          # replace profile with temporary file
	@[ -f $@ ] || cat ${@:%=%.bak} > $@          # restore backup on failure
	@chmod 755 $@                                # make new profile executable

${KSHRC}:
	@echo "Generating $@"

${ALIASES}:
	@echo "Generating $@"

${XINITRC}:
	@echo "Generating $@"

${XRESOURCES}:
	@echo "Generating $@"

${VIMRC}:
	@echo "Generating $@"

${FVWMRC}:
	@echo "Generating $@"

${VIMBUNDLES}:
	@echo "Installing $@ vim plugin"

${BOOKS}:
	@echo "Installing $@ book"

