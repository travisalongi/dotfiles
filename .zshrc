#_________  _   _ ____   ____
#|__  / ___|| | | |  _ \ / ___|
#  / /\___ \| |_| | |_) | |
# / /_ ___) |  _  |  _ <| |___
#/____|____/|_| |_|_| \_\\____|
#

# cd ~

# Set up path for python env
export PYTHONPATH=PYTHONPATH:/home/talongi/Zephyrus_share/Python_packages/My_definitions
export PATH=$PATH:$HOME/Scripts:$HOME/.emacs.d/bin:/usr/bin/lua-language-server
source $HOME/.config/fzf/fzfrc
source $HOME/.config/zoxide/zoxiderc

export VISUAL='nvim'
export EDITOR='nvim'
# export MANPAGER='nvim +Man!'
export ZSH="$HOME/.oh-my-zsh/"
export MANPAGER='bat -p'
export PAGER='less'
export BROWSER='brave'
export READER='zathura'
export IMAGE='sxiv'
export VIDEO='mpv'

export BAT_THEME='Catppuccin-mocha'


# Remap capslock to escape
# setxkbmap -option caps:escape

# My aliases
alias fm='explorer.exe .'
alias cl='clear'
alias clock='tty-clock -cs -C 4'
alias config='/usr/sbin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias dr='dragon'
# alias e='emacsclient -cn'
# alias emacs='emacsclient -cn'
alias head='head -n 15'
# alias ipython="ipython --no-banner"
alias ipy="ipython --no-banner"
alias lg='lazygit'
alias ll='COLUMNS=80 exa -lha --icons --sort=modified'
alias ls='COLUMNS=80 exa --icons --sort=modified'
alias lt='exa -T --icons --sort=modified'
alias n='ncmpcpp'
alias r='ranger'
# alias rg="sk --ansi -i -c 'ag --color "{}"'"
alias rg='rfv'
alias rm='trash-put'
alias ss='cmatrix -C cyan -t zephyrus'
alias ss='cmatrix -s -C blue'
alias sx='sxiv'
alias sxt='sxiv * -t -f &'
alias sz='source $HOME/.zshrc'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias weather='curl wttr.in'
alias x='exit'
alias za='zathura'
alias cat='bat'
alias po='git config oh-my-zsh.hide-info 1'
alias zell='zellij -l ~/.config/zellij/dev.kdl'

# Fuzzy change directory
funciton fcd() {
	cd "$(fd -t d | fzf)" 
}

# Fuzzy open
funciton op() {
	xdg-open "$(fd -I -t f | fzf)" # -I = no .gitignore
}
# Fuzzy history search
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] &&fc -l 1 || history) | fzf | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\\\/g')
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
# alias nicoya='ssh -o TCPKeepAlive=yes -X -Y talongi@nicoya.pmc.ucsc.edu'
# alias NAS='ssh -p 5858 talongi@174.160.84.110'
alias jeffreys='ssh -o TCPKeepAlive=yes -X -Y talongi@jeffreys.pmc.ucsc.edu'
alias nicoya='sshfs talongi@nicoya.pmc.ucsc.edu:/home/talongi ~/Nicoya-remote'
alias NAS="sshfs talongi@174.160.84.110:/share/CACHEDEV3_DATA/All ~/NAS-remote -p 5858"

# Increase key speed via a rate change -LS
xset r rate 300 70

# Path to your oh-my-zsh installation.
ZSH_THEME="cloud"
CASE_SENSITIVE="false"
plugins=(zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
setopt GLOB_DOTS

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


alias ls='exa --icons --reverse --sort=modified'
alias ll='exa -lha --icons --reverse --sort=modified'
alias lt='exa -T --icons'


# Remove background ls colors
eval "$(dircolors -p | \
    sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | \
    dircolors /dev/stdin)"


# Use vim keybindings
bindkey -v
bindkey -M viins '^R' history-incremental-pattern-search-backward
export KEYTIMEOUT=1


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/home/talongi/.local/bin/micromamba";
export MAMBA_ROOT_PREFIX="/home/talongi/micromamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/talongi/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/home/talongi/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/home/talongi/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<

alias mm='micromamba'
alias mma='micromamba activate'
mma

echo $USER | figlet -f mini
