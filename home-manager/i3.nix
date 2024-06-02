{ pkgs, lib, config, ... }: {

  options = { i3.enable = lib.mkEnableOption "enable i3"; };

  config = lib.mkIf config.i3.enable {
    programs.i3status-rust = {
      enable = true;
      bars = {
        top = {
          # theme = "solarized-dark";
          # icons = "awesome4";
          settings = {
            theme =  {
              # theme = "solarized-dark";
              theme = "nord-dark";
              # overrides = {
              #   idle_bg = "#123456";
              #   idle_fg = "#abcdef";
              # };
            };
          };
          blocks = [
            # {
            #   block = "custom";
            #   command = "xkblayout-state print %s | awk '{print $1}'";
            #   interval = 1;
            #   click = [{
            #     button = "left";
            #     cmd = "setxkbmap";
            #   }];
            # }
            {
              block = "time";
              interval = 5;
              format = " $timestamp.datetime(f:'%Y/%m/%d %H:%M') ";
            }
            {
              block = "sound";
              click = [{
                button = "left";
                cmd = "pavucontrol";
              }];
            }
            {
              block = "cpu";
              info_cpu = 20;
              warning_cpu = 50;
              critical_cpu = 90; 
            }
            {
              block = "memory";
              format = " $icon $mem_total_used_percents.eng(w:2) ";
              format_alt = " $icon_swap $swap_used_percents.eng(w:2) ";
            }
            {
              block = "disk_space";
              path = "/";
              info_type = "available";
              interval = 20;
              warning = 20.0;
              alert = 10.0;
              format = " $icon root: $available.eng(w:2) ";
            }
         ];
        };
      };
    };

    xsession.windowManager.i3 = {
      enable = true;
      config = {
        bars = [
          {
            position = "top";
            statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
          }
        ];

        terminal = "alacritty";
        defaultWorkspace = "workspace number 1";

        window.titlebar = false;
        colors.background = "#5e81ac";

        keybindings = let
            modifier = config.xsession.windowManager.i3.config.modifier;
          in lib.mkOptionDefault {
            "${modifier}+h" = "focus left";
            "${modifier}+l" = "focus right";
            "${modifier}+Shift+c" = "reload";
            "${modifier}+Shift+r" = "restart";
            "${modifier}+Shift+e" =
              "exec i3-nagbar -t warning -m 'Do you want to exit i3?' -b 'Yes' 'i3-msg exit'";
          };
      };
    };

  };
}
