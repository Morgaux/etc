#
# Main Makefile for linking, generating, and otherwise managing config files.
#
# Must be first non-comment
.POSIX:

# CONFIG {{{

# DIRS {{{
# This section defines the directories used by groups of targets, allowing
# generic groups of targets to initialize the targets in that directory.

VIM_BUNDLE_DIR := ${HOME}/.vim/bundle
BOOK_DIR       := ${HOME}/var/books

# }}}

# TARGET {{{
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

REPO_FILES := Makefile

# }}}

# RULES {{{
# This section defines the actual implementations of the rules to build the
# target files as needed, and their interdependencies.

all: rc_files misc_files installations
	@echo "Completed building $@"

rc_files: ${KSHRC} ${XINITRC} ${VIMRC} ${FVWMRC}

misc_files: ${PROFILE} ${ALIASES}

installations: ${VIMBUNDLES} ${BOOKS}

# PROFILE {{{
# This section defines the generation of the ~/.profile file and it's
# dependencies. Namely, the profile file is simply the concatenated sum of the
# snippets listed in ${PROFILE_SNIPPETS}. These are concatenated in the order
# given and placed in the ~/.profile file with a warning header to not modify
# the file by hand.

# Files needed to generate ${PROFILE}, in the order used.
PROFILE_SNIPPETS := snippets/detect_shell.sh             \
                    snippets/environment.sh              \
                    snippets/clear_aliases.sh            \
                    snippets/doas_aliases.sh             \
                    snippets/misc_aliases.sh             \
                    snippets/sudo_aliases.sh             \
                    snippets/clean_home.sh               \
                    snippets/git_config.sh               \
                    snippets/git_repositories.sh         \
                    snippets/xdg_directories.sh          \
                    snippets/daemons.sh                  \
                    snippets/auto_commit_vim_spelling.sh \
                    snippets/auto_startx.sh

# Rules to generate profile file
${PROFILE}: ${REPO_FILES} ${PROFILE_SNIPPETS}
	@echo "Generating $@..."
	@{                                                                     \
		echo "#!/bin/sh"                                             ; \
		echo ""                                                      ; \
		echo "##                                                 ##" ; \
		echo "#                !!! IMPORTANT !!!                  #" ; \
		echo "#                                                   #" ; \
		echo "#        DO NOT MODIFY - FILE AUTO-GENERATED        #" ; \
		echo "#                                                   #" ; \
		echo "#                                                   #" ; \
		echo "#              Mi volas vidi morgaux                #" ; \
		echo "#                                                   #" ; \
		echo "#                                                   #" ; \
		echo "##                                                 ##" ; \
		echo ""                                                      ; \
		cat ${PROFILE_SNIPPETS} | sed -n '/#!\/bin/!p'               ; \
	} > ${@:%=%.tmp}                             # create new temporary file
	@[ -f $@ ] && cat $@ > ${@:%=%.bak} || true  # make a back up
	@rm -f $@                                    # remove old file
	@mv ${@:%=%.tmp} $@                          # replace old file with tmp
	@[ -f $@ ] || cat ${@:%=%.bak} > $@          # restore backup on failure
	@chmod 755 $@                                # make new file executable

# }}}

# KSHRC {{{
# This section defines the creation of the ksh(1) configuration files, this
# applies for both the mksh(1) version I prefer for use on linux, and the
# pdksh(1) public domain version in use on OpenBSD.

# These are the *.ksh snippets used in the ${KSHRC} target, however, ${KSHRC}
# also uses some other, POSIX sh(1) snippets, these are defined in the
# ${KSHRC_SH_SNIPPETS} variable as opposed to the ${KSHRC_KSH_SNIPPETS}. As with
# the other snippet variables, the order of definition __within__ the variable
# define the order of inclusion. As in this case the ${KSHRC} files are
# configurations for their respective implementation of the Korn shell language
# and interpreter, the ${KSHRC_KSH_SNIPPETS} snippets (with the extension *.ksh)
# are written in the Korn shell language, and since the .kshrc file is defined
# (elsewhere) as the value of ENV in the shell environment, it is possible that
# the ${KSHRC} file will get read by a different shell that cannot understand
# some ksh-isms. So to prevent this, the *.sh snippets are included first, and
# then a shell detection snippet (hardcoded in the rule rather than a *.ksh
# file) determines whether the shell reading the ${KSHRC} file should stop there
# or continue, depending on it's ability to understand the ksh language. Only
# after this point can the *.ksh snippets be included.
KSHRC_KSH_SNIPPETS := snippets/cd_overload.ksh \
                      snippets/emacs_navigation.ksh \
                      snippets/history.ksh \
                      snippets/prompt.ksh

KSHRC_SH_SNIPPETS  := snippets/detect_shell.sh \
                      snippets/auto_commit_vim_spelling.sh \
                      snippets/welcome_message.sh

${KSHRC}: ${REPO_FILES} ${ALIASES} ${KSHRC_SH_SNIPPETS} ${KSHRC_KSH_SNIPPETS}
	@echo "Generating $@..."
	@{                                                                     \
		echo '#!/bin/ksh'                                            ; \
		cat ${KSHRC_SH_SNIPPETS} | sed -n '/#!\/bin/!p'              ; \
		echo ''                                                      ; \
		echo 'case "$$CURRENT_SHELL" in'                             ; \
		echo '	*ksh*)'                                              ; \
		echo '		if [[ $$- = *i* ]]'                          ; \
		echo '		then'                                        ; \
		echo '			# try sourcing global kshrc files'   ; \
		echo '			for sys_kshrc in /etc/ksh.kshrc'     ; \
		echo '			do'                                  ; \
		echo '				if [ -f "$$sys_kshrc" ]'     ; \
		echo '				then'                        ; \
		echo '					. "$$sys_kshrc"'     ; \
		echo '				fi'                          ; \
		echo '			done'                                ; \
		echo '		else'                                        ; \
		echo '			return'                              ; \
		echo '		fi'                                          ; \
		echo '		;;'                                          ; \
		echo '	*)'                                                  ; \
		echo '		# Source aliases for non-ksh, then exit'     ; \
		echo '		if [ -f "$$HOME/.aliases" ]'                 ; \
		echo '		then'                                        ; \
		echo '			. "$$HOME/.aliases"'                 ; \
		echo '		fi'                                          ; \
		echo '		return'                                      ; \
		echo '		;;'                                          ; \
		echo 'esac'                                                  ; \
		echo ''                                                      ; \
		cat ${KSHRC_KSH_SNIPPETS} | sed -n '/#!\/bin/!p'             ; \
	} > ${@:%=%.tmp}
	@[ -f $@ ] && cat $@ > ${@:%=%.bak} || true  # make a back up
	@rm -f $@                                    # remove old file
	@mv ${@:%=%.tmp} $@                          # replace old file with tmp
	@[ -f $@ ] || cat ${@:%=%.bak} > $@          # restore backup on failure
	@chmod 755 $@                                # make new file executable

# }}}

# ALIASES {{{
# This section defines the creation and content of the ~/.aliases file, which
# provides easy to type shortcuts for interactive shell use.

# These are all of the different alias definition files, to be included in the
# ~/.aliases file upon creation.
ALIAS_SNIPPETS := snippets/misc_aliases.sh  \
                  snippets/clear_aliases.sh \
                  snippets/doas_aliases.sh  \
                  snippets/sudo_aliases.sh

${ALIASES}: ${REPO_FILES} ${ALIAS_SNIPPETS}
	@echo "Generating $@..."
	@{ echo "#!/bin/sh" ; cat $^ | sed -n '/#!\/bin/!p' ; } > $@

# }}}

# XRESOURCES {{{
# This section defines the creation and content of the Xorg configuration files,
# specifically the xinitrc and Xresources files, although the xsession and
# Xdefaults files are also provided as fallbacks and for backwards
# compatibility with older versions of Xorg.

XRESOURCES_FILES := X11/scrolling.Xresources X11/colours.Xresources
XINIT_SNIPPETS   := snippets/font_config.sh \
                    snippets/keyring.sh \
                    snippets/start_desktop_environment.sh

${XINITRC}: ${REPO_FILES} ${XINIT_SNIPPETS}
	@echo "Generating $@..."
	@{ echo "#!/bin/sh" ; cat $^ | sed -n '/#!\/bin/!p' ; } > $@

${XRESOURCES}: ${REPO_FILES} ${XRESOURCES_FILES}
	@echo "Generating $@..."
	@cat ${XRESOURCES_FILES} > $@

# }}}

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
${VIMRC}: ${REPO_FILES} ${ALL_VIMRCS}
	@echo "Generating $@..."
	@cat ${ALL_VIMRCS} > $@

# }}}

# FVWMRC {{{
# This section defines the generation of the FVWMRC file for configuring the
# FVWM window manager, since I only use this on OpenBSD, I simply have a
# slightly modified file in this directory, there's no need to break it down
# into sub-files.

${FVWMRC}: ${REPO_FILES} fvwm/fvwmrc
	@echo "Generating $@..."
	@cat $^ > $@

# }}}

# VIM BUNDLES {{{

${VIMBUNDLES}: ${REPO_FILES} ${VIM_BUNDLE_DIR}
	@echo "Installing vim plugin: $@..."

# }}}

# BOOKS {{{

${BOOKS}: ${REPO_FILES}
	@echo "Installing book: $@..."

# }}}

.PHONY: all rc_files misc_files installations

# }}}

