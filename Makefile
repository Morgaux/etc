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

# PROFILE {{{

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

# Rules to generate profile file
${PROFILE}: ${PROFILE_SNIPPETS}
	@echo "Generating $@..."
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

# }}}

${KSHRC}:
	@echo "Generating $@..."

${ALIASES}:
	@echo "Generating $@..."

${XINITRC}:
	@echo "Generating $@..."

${XRESOURCES}:
	@echo "Generating $@..."

# VIMRC {{{

# These are the sub sections of the main vimrc file, here they are listed in
# order of inclusion __within__ __that__ __group__, the __group__ order is misc
# then plugins then language.
MISC_VIMRCS     := pathogen generic jcs typing visual
PLUGIN_VIMRCS   := colors-github git-messenger gitgutter illuminate mucomplete \
                   syntastic
LANGUAGE_VIMRCS := c cpp csharp fortune haskell java javascript latex makefile \
                   markdown python razor scala shell vimscript

# The above definitions allow a simplified short hand for identifing *.vimrc
# files, however, to added the extenstion and path, they are combined into the
# final .vimrc file.
ALL_VIMRCS := ${MISC_VIMRCS:%=vim/%.vimrc} \
              ${PLUGIN_VIMRCS:%=vim/%.vimrc} \
              ${LANGUAGE_VIMRCS:%=vim/%.vimrc}

# Rules to build vimrc files
${VIMRC}: ${ALL_VIMRCS}
	@echo "Generating $@..."
	@cat ${ALL_VIMRCS} > $@

# }}}

${FVWMRC}:
	@echo "Generating $@..."

${VIMBUNDLES}:
	@echo "Installing vim plugin: $@..."

${BOOKS}:
	@echo "Installing book: $@..."

