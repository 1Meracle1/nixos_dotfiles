{ pkgs, lib, config, ... }: {

  options = { i3.enable = lib.mkEnableOption "enable i3"; };

  config = lib.mkIf config.i3.enable {
    programs.i3status-rust = {
      enable = true;
      bars = {
        top = {
          theme = "solarized-dark";
          icons = "awesome6";
          settings = {
            theme =  {
              # theme = "solarized-dark";
              # theme = "nord-dark";
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

    programs.i3status = {
      enable = false;
      enableDefault = false;
      general = {
        interval 		= 1;
        colors 			= true;
        color_good      = "#88b090";
        color_degraded  = "#ccdc90";
        color_bad       = "#e89393";
      };

      modules = {
        "tztime local" = {
          position = 0;
          settings = {
            format = " %A %e.%B   %H:%M:%S";
          };
        };
        "disk /" = {
          position = 2;
          settings = {
            format = "/ %avail";
          };
        };
        "load" = {
          position = 3;
          settings = {
            format = " %1min";
          };
        };
        "cpu_usage" = {
          position = 4;
          settings = {
            format = " %usage";
          };
        };
        "cpu_temperature 0" = {
          position = 5;
          settings = {
            format = " %degrees°C";
          };
        };
      };
    };
    

    xsession.windowManager.i3 = {
      enable = true;
      config = {
        bars = [
          {
            position = "top";
            # statusCommand = "${pkgs.i3status}/bin/i3status";
            # fc-list|grep jetbrains-mono
            fonts = {
              names = [ "JetBrains Mono" ];
              style = "Regular";
              size = 13.0;
            };
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
            "${modifier}+Shift+h" = "move left";
            "${modifier}+Shift+j" = "move down";
            "${modifier}+Shift+k" = "move up";
            "${modifier}+Shift+l" = "move right";
        };

        fonts = {
          # names = ["Consolas Menlo Monospace"];
          size = 14.0;
          # style = "Bold";
        };
      };

      extraConfig = ''
        exec `feh --bg-fill ~/nixos_dotfiles/wallpapers/redd-f-wOj5odhDOZ0-unsplash.jpg`
        exec `${pkgs.xorg.xrandr}/bin/xrandr --output DP-4 --mode 5120x1440`
      '';
    };

  };
}
