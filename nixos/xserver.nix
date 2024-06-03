{ pkgs, ... }: {

  services.xserver = {
    enable = true;

    # Configure keymap in X11
    xkb = {
      layout = "us,ru";
      options = "grp:alt_space_toggle";
    };

    desktopManager = {
      xterm.enable = false;
    };
   
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
        i3status # gives you the default i3 status bar
        i3lock #default i3 screen locker
        i3blocks #if you are planning on using i3blocks over i3status
     ];
    };

    displayManager.setupCommands = ''
        ${pkgs.xorg.xrandr}/bin/xrandr --output DP-4 --mode 5120x1440
      '';

    # Enable the LXQT Desktop Environment.
    # displayManager.lightdm.enable = false;
    # desktopManager.lxqt.enable = false;

    # Enable the KDE Plasma Desktop Environment.
    #displayManager.sddm.enable = true;
    # desktopManager.plasma5.enable = true;
  };

  services.displayManager = {
      defaultSession = "none+i3";
      sddm.enable = true;
  };
}
