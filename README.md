# Steps to do for privileged dirs

-> Backup pacman configuration
-> everything in the pacman.d 

-!> always read the archwiki or the Gentoo Wiki. They are fricking goldmine 
-

-> if using the Yazi File Manager, always check the package.toml file in Stable Distros.

-> When stowing into the $XDG_CONFIG_HOME/systemd/user/ directory always stow those first and then enable any user services
    otherwise conflicting files and broken symlinks will occur to the .dotfiles directory
