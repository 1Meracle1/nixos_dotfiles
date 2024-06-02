{ pkgs, lib, config, ... }: {

  options = { zsh.enable = lib.mkEnableOption "enable zsh"; };

  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = 
        let
          flakeDir = "~/nixos_dotfiles";
        in {
          rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
          upd = "nix flake update ${flakeDir}";
          upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";

          hms = "home-manager switch --flake ${flakeDir}";

          conf = "hx ${flakeDir}/nixos/configuration.nix";
          pkgs = "hx ${flakeDir}/nixos/packages.nix";

          cls = "clear";
          ff = "neofetch";
        };

      history.size = 10000;
      history.path = "${config.xdg.dataHome}/zsh/history";

      envExtra = "neofetch";

      oh-my-zsh = {
        enable = true;
        # plugins = [
        #   "git"
        #   "sudo"
        # ];
        # theme = "";
      };
    };
  };
}
