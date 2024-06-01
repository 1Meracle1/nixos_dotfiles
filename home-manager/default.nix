# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    ./helix.nix
    ./i3.nix
  ];

  # Recommended Nix settings
  home = {
    username = "qamosu";
    homeDirectory = "/home/qamosu";

    packages = with pkgs; [
      # Nix dev
      # cachix
      nil # Nix language server
      # nix-info
      # nixpkgs-fmt
      nixfmt-classic
      # nixfmt-rfc-style
      # nixci
      # nix-health
      starship
      helix
      fzf
      # i3status-rust
      alacritty
      variety
      pcmanfm
      telegram-desktop
      discord
      feh
      pavucontrol
      xkblayout-state
    ];
  };

  helix.enable = true;
  i3.enable = true;

  # Better `cat`
  # bat.enable = true;
  # # Type `z <pat>` to cd to some directory
  # zoxide.enable = true;
  # # Type `<ctrl> + r` to fuzzy search your shell history
  # fzf.enable = true;
  # jq.enable = true;
  # htop.enable = true;

  programs.starship = {
    enable = true;
    settings = {
      username = {
        style_user = "blue bold";
        style_root = "red bold";
        format = "[$user]($style) ";
        disabled = false;
        show_always = true;
      };
      hostname = {
        ssh_only = false;
        ssh_symbol = "🌐 ";
        format = "on [$hostname](bold red) ";
        trim_at = ".local";
        disabled = false;
      };
    };
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "1Meracle1";
    userEmail = "bahorin.ivan@gmail.com";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
