{ pkgs, lib, config, ... }: {

  options = { helix.enable = lib.mkEnableOption "enable helix"; };

  config = lib.mkIf config.helix.enable {
    programs.helix = {
      enable = true;
      settings = {
        theme = "tokyonight";
        editor = {
          line-number = "relative";
          mouse = false;
          auto-format = true;
          cursor-shape = {
            normal = "block";
            insert = "bar";
            select = "underline";
          };
          file-picker.hidden = false;
          lsp.display-messages = true;
        };
      };
      languages.language = [{
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt-classic}/bin/nixfmt-classic";
      }];
      # themes = {
      #   autumn_night_transparent = {
      #     "inherits" = "autumn_night";
      #     "ui.background" = { };
      #   };
      # };
    };
  };
}
