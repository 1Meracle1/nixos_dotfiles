{ pkgs, lib, config, ... }: {

  options = { htop.enable = lib.mkEnableOption "enable htop"; };

  config = lib.mkIf config.htop.enable {
    programs.htop = {
      enable = true;
      settings = {
        tree_view = 1;
      };
    };
  };
}
