
# ------------------------------- ZSH PLUGINS ---------------------------------
# Plugin source helper
_source_plugin() {
	local plugin_name="$1"
	for basedir in /usr/share/zsh/plugins /usr/share; do
		plugin="$basedir/$plugin_name/$plugin_name.zsh"
		[ -f "$plugin" ] && source "$plugin" && return 0
	done
	echo "\033[33m[ ! ]\033[0m ZSH ${plugin_name#zsh-} not installed"
	return 1
}

# ZSH Autosuggestions
_source_plugin zsh-autosuggestions && ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'

# ZSH Syntax Highlighting
if _source_plugin zsh-syntax-highlighting; then
	ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
	ZSH_HIGHLIGHT_STYLES[default]=none
	ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=white,underline
	ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
	ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
	ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[path]=bold
	ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
	ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
	ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[command-substitution]=none
	ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[process-substitution]=none
	ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
	ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[assign]=none
	ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
	ZSH_HIGHLIGHT_STYLES[named-fd]=none
	ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
	ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
	ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
	ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
fi

unset -f _source_plugin

# POWERLEVEL
if ! [[ $(tty) = /dev/tty* ]]; then
	if source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme 2> /dev/null; then
		s=' ' # fix too wide icons
		POWERLEVEL9K_MODE=nerdfont-complete
		POWERLEVEL9K_SHORTEN_STRATEGY=truncate_beginning
		POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
		POWERLEVEL9K_PROMPT_ON_NEWLINE=true
		POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
		POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
    # shellcheck disable=SC2016
		POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='${P9K_CONTENT} $(whoami | grep -v "^root\$")'
		POWERLEVEL9K_OS_ICON_BACKGROUND=red
		POWERLEVEL9K_OS_ICON_FOREGROUND=white
		POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND=black
		POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND=red
		POWERLEVEL9K_SSH_BACKGROUND=white
		POWERLEVEL9K_SSH_FOREGROUND=blue
		POWERLEVEL9K_FOLDER_ICON=
		POWERLEVEL9K_DIR_BACKGROUND=blue
		POWERLEVEL9K_DIR_FOREGROUND=black
		POWERLEVEL9K_DIR_WRITABLE_BACKGROUND=black
		POWERLEVEL9K_DIR_WRITABLE_FOREGROUND=red
		POWERLEVEL9K_VCS_CLEAN_FOREGROUND=black
		POWERLEVEL9K_VCS_CLEAN_BACKGROUND=green
		POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=black
		POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=yellow
		POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=white
		POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=black
		POWERLEVEL9K_VCS_UNTRACKED_ICON=●
		POWERLEVEL9K_VCS_UNSTAGED_ICON=±
		POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=↓
		POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=↑
		POWERLEVEL9K_VCS_COMMIT_ICON=$s
		POWERLEVEL9K_STATUS_VERBOSE=false
		POWERLEVEL9K_STATUS_VERBOSE=false
		POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
		POWERLEVEL9K_EXECUTION_TIME_ICON=$s
		POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
		POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=black
		POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=blue
		POWERLEVEL9K_COMMAND_BACKGROUND_JOBS_BACKGROUND=black
		POWERLEVEL9K_COMMAND_BACKGROUND_JOBS_FOREGROUND=cyan
		POWERLEVEL9K_TIME_ICON=
		POWERLEVEL9K_TIME_FORMAT='%D{%I:%M}'
		POWERLEVEL9K_TIME_BACKGROUND=black
		POWERLEVEL9K_TIME_FOREGROUND=white
		POWERLEVEL9K_RAM_ICON=
		POWERLEVEL9K_RAM_FOREGROUND=black
		POWERLEVEL9K_RAM_BACKGROUND=yellow
		POWERLEVEL9K_VI_MODE_FOREGROUND=black
		POWERLEVEL9K_VI_COMMAND_MODE_STRING=NORMAL
		POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND=green
		POWERLEVEL9K_VI_VISUAL_MODE_STRING=VISUAL
		POWERLEVEL9K_VI_MODE_VISUAL_BACKGROUND=blue
		POWERLEVEL9K_VI_OVERWRITE_MODE_STRING=OVERTYPE
		POWERLEVEL9K_VI_MODE_OVERWRITE_BACKGROUND=red
		POWERLEVEL9K_VI_INSERT_MODE_STRING=
		POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
		POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
		POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%F{blue}╭─'
		POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{blue}╰%f '
		POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator ssh dir dir_writable vcs)
		POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status command_execution_time background_jobs time ram)
		unset s
	else
		echo '\033[33m[ ! ]\033[0m ZSH powerlevel10k not installed'
	fi
else
	clear
	echo
	echo
fi

switch_powerlevel_multiline_prompt(){
	[ $POWERLEVEL9K_PROMPT_ON_NEWLINE = true ] \
		&& POWERLEVEL9K_PROMPT_ON_NEWLINE=false \
		|| POWERLEVEL9K_PROMPT_ON_NEWLINE=true

	zle && zle accept-line
}
zle -N switch_powerlevel_multiline_prompt
bindkey ^P switch_powerlevel_multiline_prompt