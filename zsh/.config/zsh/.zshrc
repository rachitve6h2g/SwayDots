# This should be at the end of the .zshrc file
eval "$(starship init zsh)"

# For zoxide 
export _ZO_ECHO='1'
eval "$(zoxide init zsh --cmd cd)"

# source aliases here
source $ZDOTDIR/aliases.zsh

# For the vim keybindings in zsh set the editor variable
export EDITOR='nvim'

# Enable kitty with wayland
export KITTY_ENABLE_WAYLAND=1

# Set some variables here
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export ZSH_CUSTOM=$XDG_CONFIG_HOME/zsh
export LESS='-R --use-color -Dd+r$Du+b$'
export MANPAGER='nvim +Man!'

# use-cache option taken from https://wiki.gentoo.org/wiki/Zsh#Add-ons
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion::complete:*' use-cache 1 
zstyle ':completion::complete:*' gain-privileges 1 

autoload -Uz compinit
compinit



# For history keeping
export HISTSIZE=2000
export HISTFILE="$ZDOTDIR/.history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt appendhistory correctall hist_ignore_space autocd extendedglob notify nomatch globdots

# For gentoo
#
# Refer https://github.com/zsh-users/zsh-syntax-highlighting/issues/951
source $ZDOTDIR/fsh/fast-syntax-highlighting.plugin.zsh

source /usr/share/zsh/site-functions/zsh-autosuggestions.zsh
source /usr/share/fzf/key-bindings.zsh
source $ZDOTDIR/fzf_catppuccin.zsh
# source $ZDOTDIR/fzf_gruvbox_material.zsh
#

ZSH_AUTOSUGGEST_STRATEGY=(completion)

# For yazi
source $ZDOTDIR/yazi.zsh

# The Amazing history option
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# Source this if you are on Archlinux
# source $ZDOTDIR/arch_zsh.zsh
