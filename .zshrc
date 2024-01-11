
export PYTHONPATH=PYTHONPATH:/home/talongi/Talongi_share/Sjb/My_definitions
export EDITOR='nvim'
export PAGER='bat'

bindkey -v
export KEYTIMEOUT=1

# Stop using oh-my-zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Aliases are in a different file
source "$HOME/.alias"

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

