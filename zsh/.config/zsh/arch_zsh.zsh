# For Archlinux
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
#
# For the zsh pacman hook
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# For rehash 
# see https://wiki.archlinux.org/title/Zsh #4.5.2 Alternative on-demand rehash SIGSUR1
TRAPUSR1() { rehash }

# The "command not found handler" 
# See the archwiki
source /usr/share/doc/pkgfile/command-not-found.zsh
