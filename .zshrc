
setopt AUTO_CD
setopt HIST_SAVE_NO_DUPS

export PATH=$PATH:$HOME/Scripts
export PYTHONPATH=PYTHONPATH:/home/talongi/Talongi_share/Sjb/My_definitions

bindkey -v
bindkey '^R' history-incremental-search-backward
export KEYTIMEOUT=1
xset r rate 300 50

autoload -Uz compinit; compinit

# Stop using oh-my-zsh
source /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Aliases are in a different file
source "$HOME/.config/zsh/.alias"
source "$HOME/Scripts/googler_at"

# Remove background highlight
LS_COLORS+=':ow=01;33'

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/home/talongi/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/talongi/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# Start Micromamba on launch
mma

# For Zoxide
eval "$(zoxide init zsh)"

# Starship prompt
eval "$(starship init zsh)"
