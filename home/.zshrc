# My constants
TRUNK=~/¦

# Environmantal variables
export EDITOR=nvim
export ARTIX_DOTFILES_DIR=$TRUNK/repositories/mine/artix-dotfiles
export PATH=$PATH:$HOME/scripts:$HOME/npm-global/bin:$HOME/go/bin
#export $(dbus-launch)

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
	export QT_QPA_PLATFORM=wayland
	export MOZ_ENABLE_WAYLAND=1
	export GDK_BACKEND=wayland
else
	export QT_QPA_PLATFORM=""
	export MOZ_ENABLE_WAYLAND=
	export GDK_BACKEND=x11
fi

# Enable colors and change prompt
PROMPT="%B %F{%(0?.green.red}•%f %F{cyan}%1~%f %b"

# Go to the trunk directory
cd $TRUNK

# History in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files

# vi mode
bindkey -v
export KEYTIMEOUT=1

# RSIT keybindings
bindkey -a 'r' vi-backward-char
bindkey -a 's' vi-forward-char
bindkey -a 'i' vi-up-line-or-history
bindkey -a 't' vi-down-line-or-history
bindkey -a 'h' vi-insert

# Use vim keys in tab complete menu
bindkey -M menuselect 'r' vi-backward-char
bindkey -M menuselect 's' vi-forward-char
bindkey -M menuselect 'i' vi-up-line-or-history
bindkey -M menuselect 't' vi-down-line-or-history

# Change cursor shape for different vi modes
function zle-keymap-select {
	if
		[[ ${KEYMAP} == vicmd ]] ||
		[[ $1 = 'block' ]]
	then
		echo -ne '\e[1 q'
	elif
		[[ ${KEYMAP} == main ]] ||
		[[ ${KEYMAP} == viins ]] ||
		[[ ${KEYMAP} = '' ]] ||
		[[ $1 = 'beam' ]]
	then
		echo -ne '\e[5 q'
	fi
}
zle -N zle-keymap-select
zle-line-init() {
	zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
	echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories
lfcd() {
	tmp="$(mktemp)"
	lf -last-dir-path="$tmp" "$@"
	if
		[[ -f "$tmp" ]]
	then
		dir="$(cat "$tmp")"
		rm -f "$tmp"
		[[ -d "$dir" ]] && [[ "$dir" != "$(pwd)" ]] && cd "$dir"
	fi
	zle reset-prompt
	zle vi-insert
}
zle -N lfcd
bindkey -a 'l' lfcd

# Autostart sway
#[ -z "$WAYLAND_DISPLAY" ] && [ "$(fgconsole)" -eq 1 ] && exec sway

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

