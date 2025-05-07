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

# Export the Gtk Theme 
export GTK_THEME='Catppuccin-Purple-Dark'

# Set some variables here
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export ZSH_CUSTOM=$XDG_CONFIG_HOME/zsh
export LESS='-R --use-color -Dd+r$Du+b$'
export MANPAGER='nvim +Man!'

# use-cache option taken from https://wiki.gentoo.org/wiki/Zsh#Add-ons
 zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
# zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion::complete:*' use-cache 1 
zstyle ':completion::complete:*' gain-privileges 1 
zstyle ':completion:*' menu select

autoload -Uz compinit
compinit



# For history keeping
export HISTSIZE=2000
export HISTFILE="$ZDOTDIR/.history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt appendhistory correctall hist_ignore_space autocd extendedglob notify nomatch globdots

# For gentoo
source $ZDOTDIR/fzf_catppuccin.zsh
# source $ZDOTDIR/fzf_gruvbox_material.zsh

# See https://wiki.archlinux.org/title/Fzf
# Do this
# source /usr/share/fzf/key-bindings.zsh
# Or this
source <(fzf --zsh)
# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || eza --tree --color=always --icons=always {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always --icons=always {} | head -200'"
source $ZDOTDIR/fsh/fast-syntax-highlighting.plugin.zsh
source /usr/share/zsh/site-functions/zsh-autosuggestions.zsh

# This plugin should be the last to map '^I' (tab) key
source $ZDOTDIR/fzf-tab/fzf-tab.plugin.zsh
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons=always --color=always $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
zstyle ':fzf-tab:*' fzf-flags --color='bg+:#313244,spinner:#f5e0dc,hl:#f38ba8,fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc,marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8,selected-bg:#45475a,border:#313244,label:#cdd6f4' --bind=tab:accept
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
# zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'


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
