# Sway configuration
alias swaycon='vim $HOME/.config/sway'
alias gocon='cd $HOME/.dotfiles'
# Important aliases
alias vim="nvim"
alias vi="nvim"
alias oldvim="/usr/bin/vim"
alias ffetch="fastfetch"

# Aliases for colored outputs
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'

# Get image on the fly
alias kitcat="kitten icat"

# Get eza working
# Can be managed by oh-my-zsh
alias l='eza --icons --color'
alias ls='eza --icons --color'
alias ll='eza --icons --color -l'
alias la='eza --icons --color -al'
alias dir='eza --icons --only-dirs --color'
alias lg='eza --icons --color --git -l'
alias lgt='eza --icons --color --git -T -l -a --level 2'
alias tree='eza --icons --color -T'
# Jump to the git source directory
alias cdg='cd $(git rev-parse --show-toplevel)'

# DANGEROUS
# DO NOT RUN IT
# It's called a fork bomb
# check this out
# https://www.youtube.com/shorts/OsDweYCQpOI
alias bomb_me=':(){:|:&};:'
# IF YOU USE THIS YOU'LL END YOUR COMPUTER

# To source .zshrc
alias sozsh='source $ZDOTDIR/.zshrc'

# Alias for colored helps 
# Also see the help function in .zshrc
# The aliases have been set keeping in mind 
# the oh-my-zsh issue about diagnostics.zsh
alias -g -- :B='-h 2>&1 | bat --language=help --style=plain'
alias -g -- :b='--help 2>&1 | bat --language=help --style=plain'
alias bathelp='bat --plain --language=help'
help() {
  "$@" --help 2>&1 | bathelp
}

# alias for editing .zshrc files directly
alias -g -- ba="vim ~/.config/zsh/"

# For neovim sql
alias nvsql="nvim '+SQLua'"

# For cd'ing back
alias '..'="cd .."

# Refer https://github.com/andreafrancia/trash-cli#but-sometimes-i-forget-to-use-trash-put-really-cant-i
# For using trash-cli instead of 'rm'
alias rm='echo "This is not the command you are looking for (use trash-cli)"; false'
alias mv='mv -iv'
