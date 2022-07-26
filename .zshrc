#_________  _   _ ____   ____
#|__  / ___|| | | |  _ \ / ___|
#  / /\___ \| |_| | |_) | |
# / /_ ___) |  _  |  _ <| |___
#/____|____/|_| |_|_| \_\\____|
#

# Set up path for python env
export PYTHONPATH=PYTHONPATH:/home/talongi/Zephyrus_share/Python_packages/My_definitions
export PATH=$PATH:$HOME/Scripts:$HOME/.emacs.d/bin

export VISUAL='nvim'
export EDITOR='nvim'
export PAGER='less'
export BROWSER='brave'
export READER='zathura'
export IMAGE='sxiv'
export VIDEO='mpv'

# Remap capslock to escape
setxkbmap -option caps:escape


# My aliases
alias emacs='emacsclient -cn'
alias e='emacsclient -cn'
alias cl='clear'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias head='head -n 15'
alias ls='COLUMNS=80 exa --icons --sort=modified'
alias ll='COLUMNS=80 exa -lha --icons --sort=modified'
alias lt='exa -T --icons --sort=modified'
alias r='ranger'
alias n='ncmpcpp'
alias za='zathura'
alias sx='sxiv'
alias sxt='sxiv * -t -f &'
alias lg='lazygit'
alias weather='curl wttr.in'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias ss='tmatrix -C cyan -t zephyrus'
alias clock='tty-clock -cs -C 4'
alias sz='source $HOME/.zshrc'
alias x='exit'
alias ipython="ipython --no-banner"
alias rm='trash-put'

# Fuzzy change directory
funciton fcd() {
	cd "$(fd -t d | fzf)"
}

# Fuzzy open
funciton open() {
	xdg-open "$(fd -t f | fzf)"
}

# Change directory on exit to lf's current directory
function lfcd() {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
alias lf='lfcd'

# Fuzzy get file path
alias getpath="find -type f | fzf | sed 's/^..//' | tr -d '\n' | xclip -selection c"

# SSH connections
alias nicoya='ssh -o TCPKeepAlive=yes -X -Y talongi@nicoya.pmc.ucsc.edu'
alias jeffreys='ssh -o TCPKeepAlive=yes -X -Y talongi@jeffreys.pmc.ucsc.edu'

# Increase key speed via a rate change -LS
xset r rate 300 70

# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh/

ZSH_THEME="cloud"
CASE_SENSITIVE="false"

plugins=(zsh-autosuggestions fzf-tab)
source $ZSH/oh-my-zsh.sh
####   ARCOLINUX SETTINGS   ####
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
setopt GLOB_DOTS

# Settings for Plugin fzf-tab
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -1 --color=always $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' continuous-trigger '/'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups


if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

#fix obvious typo's
alias cd..='cd ..'
alias pdw="pwd"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'

#continue download
alias wget="wget -c"

# Aliases for software managment
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#hardware info --short
alias hw="hwinfo --short"

#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"
#our experimental - best option for the moment
alias mirrorx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias mirrorxx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"

#mounting the folder Public for exchange between host and guest on virtualbox
alias vbm="sudo /usr/local/bin/arcolinux-vbox-share"

#youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#search content with ripgrep
alias rg="rg --sort path"

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#GPG
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias fix-gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-key="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#create a file called .zshrc-personal and put all your personal aliases
#in there. They will not be overwritten by skel.
[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal
alias ls='exa --icons --reverse --sort=modified'
alias ll='exa -lha --icons --reverse --sort=modified'
alias lt='exa -T --icons'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/talongi/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/talongi/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/talongi/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/talongi/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# remove background ls colors
eval "$(dircolors -p | \
    sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | \
    dircolors /dev/stdin)"

# FZF theme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
 --color=fg:#e0def4,bg:#2a273f,hl:#6e6a86
 --color=fg+:#908caa,bg+:#232136,hl+:#908caa
 --color=info:#9ccfd8,prompt:#f6c177,pointer:#c4a7e7
 --color=marker:#ea9a97,spinner:#eb6f92,header:#ea9a97"

# Use vim keybindings
bindkey -v
bindkey -M viins '^R' history-incremental-pattern-search-backward
export KEYTIMEOUT=1

# =============================================================================

# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd() {
    \builtin pwd -L
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd() {
    # shellcheck disable=SC2164
    \builtin cd "$@"
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
function __zoxide_hook() {
    \command zoxide add -- "$(__zoxide_pwd || \builtin true)"
}

# Initialize hook.
# shellcheck disable=SC2154
if [[ ${precmd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]] && [[ ${chpwd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]]; then
    chpwd_functions+=(__zoxide_hook)
fi

# =============================================================================
#
# When using zoxide with --no-aliases, alias these internal functions as
# desired.
#

__zoxide_z_prefix='z#'

# Jump to a directory using only keywords.
function __zoxide_z() {
    # shellcheck disable=SC2199
    if [[ "$#" -eq 0 ]]; then
	__zoxide_cd ~
    elif [[ "$#" -eq 1 ]] && [[ "$1" = '-' ]]; then
	if [[ -n "${OLDPWD}" ]]; then
	    __zoxide_cd "${OLDPWD}"
	else
	    # shellcheck disable=SC2016
	    \builtin printf 'zoxide: $OLDPWD is not set'
	    return 1
	fi
    elif [[ "$#" -eq 1 ]] && [[ -d "$1" ]]; then
	__zoxide_cd "$1"
    elif [[ "$@[-1]" == "${__zoxide_z_prefix}"* ]]; then
	# shellcheck disable=SC2124
	\builtin local result="${@[-1]}"
	__zoxide_cd "${result:${#__zoxide_z_prefix}}"
    else
	\builtin local result
	result="$(\command zoxide query --exclude "$(__zoxide_pwd || \builtin true)" -- "$@")" &&
	    __zoxide_cd "${result}"
    fi
}

# Jump to a directory using interactive search.
function __zoxide_zi() {
    \builtin local result
    result="$(\command zoxide query -i -- "$@")" && __zoxide_cd "${result}"
}

# =============================================================================
#
# Convenient aliases for zoxide. Disable these using --no-aliases.
#

# Remove definitions.
function __zoxide_unset() {
    \builtin unalias "$@" &>/dev/null || \builtin true
    \builtin unfunction "$@" &>/dev/null || \builtin true
    \builtin unset "$@" &>/dev/null
}

__zoxide_unset z
function z() {
    __zoxide_z "$@"
}

__zoxide_unset zi
function zi() {
    __zoxide_zi "$@"
}

if [[ -o zle ]]; then
    __zoxide_unset _z
    function _z() {
	# Only show completions when the cursor is at the end of the line.
	# shellcheck disable=SC2154
	[[ "${#words[@]}" -eq "${CURRENT}" ]] || return

	if [[ "${#words[@]}" -eq 2 ]]; then
	    _files -/
	elif [[ "${words[-1]}" == '' ]]; then
	    \builtin local result
	    # shellcheck disable=SC2086
	    if result="$(\command zoxide query -i -- ${words[2,-1]})"; then
		__zoxide_result="${result}"
	    else
		__zoxide_result=''
	    fi
	    \builtin printf '\e[5n'
	fi
    }

    __zoxide_unset _z_helper
    function _z_helper() {
	\builtin local result="${__zoxide_z_prefix}${__zoxide_result}"
	# shellcheck disable=SC2296
	[[ -n "${__zoxide_result}" ]] && LBUFFER="${LBUFFER}${(q-)result}"
	\builtin zle reset-prompt
    }

    \builtin zle -N _z_helper
    \builtin bindkey "\e[0n" _z_helper
    if [[ "${+functions[compdef]}" -ne 0 ]]; then
	\compdef -d z
	\compdef _z z
    fi
fi
