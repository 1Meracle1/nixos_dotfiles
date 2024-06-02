{ pkgs, ... }: {

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [
      nil # Nix language server
      nixfmt-classic
      helix
      fzf
      pcmanfm
      telegram-desktop
      pavucontrol
      xkblayout-state
      kitty
      gtk3 # only to try to fix terminal apps not opening on wayland
      spotify

      # Desktop apps
      chromium
      telegram-desktop
      alacritty
      # obs-studio
      rofi
      wofi
      # mpv
      # kdenlive # video editing tool
      discord
      gparted
      obsidian
      zoom-us
      pcmanfm-qt
  
      # Coding stuff
      gnumake
      gcc
      nodejs
      python
      (python3.withPackages (ps: with ps; [ requests ]))
  
      # CLI utils
      neofetch
      file
      tree
      wget
      git
      fastfetch
      htop
      nix-index
      unzip
      scrot
      ffmpeg
      light
      lux
      mediainfo
      ranger
      zram-generator
      cava
      zip
      ntfs3g
      yt-dlp
      brightnessctl
      swww
      openssl
      lazygit
      bluez
      bluez-tools
  
      # GUI utils
      feh
      # imv
      dmenu
      # screenkey
      # mako
      gromit-mpx
  
      # Xorg stuff
      #xterm
      #xclip
      #xorg.xbacklight
  
      # Wayland stuff
      xwayland
      wl-clipboard
      cliphist
  
      # WMs and stuff
      # herbstluftwm
      hyprland
      seatd
      xdg-desktop-portal-hyprland
      polybar
      waybar
  
      # Sound
      pipewire
      pulseaudio
      pamixer
  
      # GPU stuff 
      amdvlk
      rocm-opencl-icd
      glaxnimate
  
      # Screenshotting
      grim
      grimblast
      slurp
      flameshot
      swappy
  
      # Other
      home-manager
      spice-vdagent
      libsForQt5.qtstyleplugin-kvantum
      libsForQt5.qt5ct
      papirus-nord
  ];

  fonts.packages = with pkgs; [
    font-awesome
    powerline-fonts
    powerline-symbols

    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}
