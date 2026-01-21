setopt AUTO_CD
setopt HIST_SAVE_NO_DUPS

# My scripts
export PATH=$PATH:$HOME/Scripts

# Python stuff
export PYTHONPATH=$PYTHONPATH:$HOME/Sjb/My_definitions:$HOME/surf/ #:$HOME/misalign3d/src/
export MPLBACKEND="module://matplotlib-backend-kitty" # Sets default backend
export MPLBACKEND_KITTY_SIZING=manual # Prevents kitty from trying to display figs as fullsize images

export HOMEBREW_NO_AUTO_UPDATE=1 # Prevents brew from updating when installing new package

autoload -U compint

# Set defaults
export EDITOR='nvim'
export VISUAL='subl'
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# Use vim bindings
bindkey -v

# Separate alias file
source $HOME/.alias

# No more oh-my-zsh
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

# Activate base python env
export MAMBA_NO_PS1=1

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Optional: make fzf show previews and smarter search behavior
export FZF_DEFAULT_OPTS='--height=80% --layout=reverse'

# I use zoxide, tv (fzf) and starship prompt
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(tv init zsh)"

# Fzf integration
source <(\fzf --zsh)

