setopt AUTO_CD
setopt HIST_SAVE_NO_DUPS

export PATH=$PATH:$HOME/Scripts
export PATH=$PATH:$HOME/Sjb/opensha-fault-sys-tools/sbin
export OPENSHA_MEM_GB=12

# export PYTHONPATH=$PYTHONPATH:$HOME/Sjb/My_definitions:$HOME/surf/Src/
export PYTHONPATH=$PYTHONPATH:$HOME/Sjb/My_definitions:$HOME/surf/

autoload -U compint

export EDITOR='nvim'
export VISUAL='zed'
export MANPAGER='nvim +Man!'
export MANWIDTH=999


bindkey -v
bindkey '^R' history-incremental-search-backward
export KEYTIMEOUT=1

source $HOME/.alias

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/fzf-tab/fzf-tab.plugin.zsh
## case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/Users/talongi/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/Users/talongi/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

mma


eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# Fzf integration
source <(fzf --zsh)

# PF_INFO="ascii os uptime pkgs memory shell palette" pfetch


