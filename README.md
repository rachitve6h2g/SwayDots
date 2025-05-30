# Steps to do for privileged dirs

-> Backup pacman configuration
-> everything in the pacman.d 

-!> always read the archwiki or the Gentoo Wiki. They are fricking goldmine 
-

-> if using the Yazi File Manager, always check the package.toml file in Stable Distros.

-> When stowing into the $XDG_CONFIG_HOME/systemd/user/ directory always stow those first and then enable any user services
    otherwise conflicting files and broken symlinks will occur to the .dotfiles directory

### Things to add to the setup

- [X] Add fzf tab completions for zsh
- [X] get neovim configuration with LazyVim
- [X] configure fzf for more power
- [ ] add settings from the config.bak to the main config files
- [ ] clean up the dotfiles a little
- [X] get catppuccin themed waybar
- [ ] Learn to use battery notification [this](https://github.com/meribold/dotfiles) can be used for ideas
- [ ] See intel microcode loading and kernel configuration (Gentoo Article)
- [ ] Set up newsboat
- [X] setup imv theme
- [X] Setup mako
- [X] mpv theme
- [X] Swaylock Setup
- [ ] Setup Yazi theming and plugins
- [ ] Setup zathura and transparency
- [ ] Use mirrorselect for selecting good mirrors
- [ ] Write a event for pausing Song/Video on unplugging earphones and playing them when plugged back in
- [ ] configure cmus and cava
- [ ] Setup wlsunset
- [ ] Get Upower settings fixed (raise the lower battery limit and lower the upper battery limit)
- [ ] Add cpu module on the right and cava module on the left of waybar
- [ ] Reduce journal size 
- [ ] Reduce swappiness
- [ ] Setup VSCodium for Coding (theme and all)
- [ ] Make systemd timer to regularly clear cache files of 'Qutebrowser and other stuff'
- [ ] setup etckeeper (or search how to keep files in /etc in Gentoo under track)
- [ ] Get /etc/portage pushed to git as well (make the portage directory as a git directory).
- [ ] Learn more about dispatch-conf, etc-update and cfg-update commands in Gentoo
- [ ] Shift zsh to zinit plugin for working in any distro
