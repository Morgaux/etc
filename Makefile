#
# Main Makefile for linking, generating, and otherwise managing config files.
#
# Must be first non-comment
.POSIX:

# DIRS {{{
# This section defines the directories used by groups of targets, allowing
# generic groups of targets to initialize the targets in that directory.

VIM_BUNDLE_DIR := ${HOME}/.vim/bundle
BOOK_DIR       := ${HOME}/var/books

# }}}

# TARGETS {{{
# This section defines the filenames and their required locations for the
# configuration files managed by this makefile and repository.

PROFILE    := ${HOME}/.profile
KSHRC      := ${HOME}/.kshrc ${HOME}/.mkshrc
ALIASES    := ${HOME}/.aliases
XINITRC    := ${HOME}/.xinitrc ${HOME}/.xsession
XRESOURCES := ${HOME}/.Xresources ${HOME}/.Xdefaults
VIMRC      := ${HOME}/.vimrc
FVWMRC     := ${HOME}/.fvwmrc

VIMBUNDLES := 
BOOKS      := 

# }}}

# RULES {{{
# This section defines the actual implementations of the rules to build the
# target files as needed, and their interdependencies.

all:

# PROFILE {{{
# This section defines the generation of the ~/.profile file and it's
# dependencies. Namely, the profile file is simply the concatenated sum of the
# snippets listed in ${PROFILE_SNIPPETS}. These are concatenated in the order
# given and placed in the ~/.profile file with a warning header to not modify
# the file by hand.

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
	@{                                                                     \
		echo '#!/bin/sh'                                             ; \
		echo ''                                                      ; \
		echo '##                                                 ##' ; \
		echo '#                !!! IMPORTANT !!!                  #' ; \
		echo '#                                                   #' ; \
		echo '#        DO NOT MODIFY - FILE AUTO-GENERATED        #' ; \
		echo '#                                                   #' ; \
		echo '#                                                   #' ; \
		echo '#              Mi volas vidi morgaux                #' ; \
		echo '#                                                   #' ; \
		echo '#                                                   #' ; \
		echo '##                                                 ##' ; \
		echo ''                                                      ; \
	} | cat - ${PROFILE_SNIPPETS} > ${@:%=%.tmp} # Create new temporary file
	@[ -f $@ ] && cat $@ > ${@:%=%.bak}          # make a back up
	@rm -f $@                                    # remove old file
	@mv ${@:%=%.tmp} $@                          # replace old file with tmp
	@[ -f $@ ] || cat ${@:%=%.bak} > $@          # restore backup on failure
	@chmod 755 $@                                # make new file executable

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
# This section defines the rules to the ~/.vimrc configuration file for vim.
# This is done via a series of sub-vimrc files, each responsible for the
# configuration of a single plugin or the rules used in a single language.
# These are then concatenated together into the main ~/.vimrc file.

# These are the sub sections of the main vimrc file, here they are listed in
# order of inclusion __within__ __that__ __group__, the __group__ order is misc
# then plugins then language.
MISC_VIMRCS     := pathogen generic jcs typing visual
PLUGIN_VIMRCS   := colors-github git-messenger gitgutter illuminate mucomplete \
                   syntastic
LANGUAGE_VIMRCS := c cpp csharp fortune haskell java javascript latex makefile \
                   markdown python razor scala shell vimscript

# The above definitions allow a simplified short hand for identifying *.vimrc
# files, however, to added the extension and path, they are combined into the
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

# }}}

