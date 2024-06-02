# nixos_dotfiles
To setup new machine:
1) add `git` system package in `/etc/nixos/configuration.nix` file
2) add `nix.settings.experimental-features = [ "nix-command" "flakes" ];` line in `/etc/nixos/configuration.nix` file
3) clone this repo
4) replace `nixos/hardware-configuration.nix` by `/etc/nixos/hardware-configuration.nix`
5) verify disk name in `nixos/bootloader.nix` compared to the one in `/etc/nixos/configuration.nix` file
6) run `sudo nixos-rebuild switch --flake .` 
7) run `home-manager switch --flake .`
8) reboot

To apply configuration changes:
`rb` or `sudo nixos-rebuild switch --flake .` 
`hms` or `home-manager switch --flake .`

To setup wallpaper:
`cp wallpapers\andre-benz-e4xOmzd8vzg-unsplash.jpg ~/.background-image`
`sudo reboot`
