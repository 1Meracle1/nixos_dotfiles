{ pkgs, lib, config, ... }: {

  options = { alacritty.enable = lib.mkEnableOption "enable alacritty"; };

  config = lib.mkIf config.alacritty.enable {
    programs.alacritty = {
      enable = true;

      settings = {
        window.opacity = 0.95;

        # font = {
        #   size = 13.0;
        #   normal = {
        #     family = "JetBrains Mono";
        #     style = "Bold";
        #   };
        # };

        # colors.primary.background = "#1d2021";
      };
    };
  };
}
