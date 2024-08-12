{ pkgs, lib, config, ... }: {

  options = { helix.enable = lib.mkEnableOption "enable helix"; };

  config = lib.mkIf config.helix.enable {
    programs.helix = {
      enable = true;
      settings = {
        theme = "deep_blue";
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
        # keys.normal = {
        #   space.space = "file_picker";
        #   space.w = ":w";
        #   space.q = ":q";
        #   esc = [ "collapse_selection" "keep_primary_selection" ];
        # };
      };
      languages.language = [{
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt-classic}/bin/nixfmt-classic";
      }];
      themes = {
        autumn_night_transparent = let
            ice_blue = "#8aaabe";
            dark_black = "#0a0a0a";
            light_yellow = "#fdff98";
            deep_purple = "#c471b9";
            white = "#ffffff";
            gray_120 = "#d1d1d1";
            gray_110 = "#c2c2c2";
            gray_90 = "#898989";
            gray_80 = "#767676";
            gray_70 = "#5d5d5d";
            gray_50 = "#383838";
            gray_20 = "#292929";
            black = "#000000";
            blue_90 = "#3691f9";
            blue_80 = "#1a85f6";
            blue_40 = "#194176";
            blue_30 = "#163764";
            red_50 = "#ce364d";
            red_40 = "#c03248";
            red_30 = "#a72a3f";
            red_20 = "#761b2d";
            red_10 = "#390813";
            green_80 = "#4ca988";
            yellow_60 = "#f8ab17";
            purple_20 = "#c07bf3";
            cyan = "#82D2CE";
            pink = "#E394DC";
            yellow = "#EBC88D";
          in {
            "attribute" = ice_blue

            "type" = ice_blue
            "type.return" = ice_blue
            "type.parameter" = ice_blue
            "constructor" = light_yellow

            "constant" = white
            # "constant.builtin" = {} # .boolean
            "constant.builtin.boolean" = cyan
            "constant.character" = yellow
            "constant.character.escape" = cyan
            "constant.numeric" = deep_purple
            "string" = deep_purple
            "string.regexp" = deep_purple
            "string.special" = { fg = deep_purple, modifiers = ["underlined"] } #.path / .url / .symbol

            "comment" = gray_90 # .line
            # "comment.block" = {} # .documentation
            "variable" = white # .builtin
            "variable.builtin" = { fg = white }
            # "variable.other" = {} # .member
            "variable.other.member" = white
            "label" = white
            "keyword" = ice_blue # .operator / .directive / .function
            "function" = light_yellow
            "function.declaration" = light_yellow
            "function.macro" = light_yellow
            "function.builtin" = light_yellow
            "function.special" = light_yellow
            #"function.declaration.method" = { fg = "lightest", modifiers = ["bold"] } #depends on #4892
            "tag" = white
            "special" = white
            "namespace" = white

            # used in theming
            # "markup" = {} # .normal / .quote / .raw
            # "markup.normal" = {} # .completion / .hover
            "markup.bold" = {  modifiers = ["bold"] }
            "markup.italic" = { modifiers = ["italic"] }
            "markup.strikethrough" = { modifiers = ["crossed_out"] }
            "markup.heading" = { fg = cyan, modifiers = ["bold"] } # .marker / .1 / .2 / .3 / .4 / .5 / .6
            "markup.list" = pink # .unnumbered / .numbered
            "markup.list.numbered" = cyan
            "markup.list.unnumbered" = cyan
            # "markup.link" = "green"
            "markup.link.url" = { fg = pink, modifiers = ['italic', 'underlined'] }
            "markup.link.text" = cyan
            "markup.link.label" = purple_20
            "markup.quote" = pink
            "markup.raw" = pink
            "markup.raw.inline" = cyan # .completion / .hover
            "markup.raw.block" = "#EB83E2"

            "diff.plus" = green_80
            "diff.minus" = red_50
            "diff.delta" = blue_80

            # ui specific
            "ui.background" = { bg = dark_black } # .separator
            "ui.statusline" = { fg = gray_120, bg = gray_20 } # .inactive / .normal / .insert / .select
            "ui.statusline.normal" = { fg = gray_120, bg = gray_20 }
            "ui.statusline.inactive" = { fg = gray_90}
            "ui.statusline.insert" = { fg = gray_20, bg = blue_90 }
            "ui.statusline.select" = { fg = gray_20, bg = yellow_60 }

            "ui.cursor" = { modifiers = ["reversed"] } # .insert / .select / .match / .primary
            "ui.cursor.match" = { bg = blue_30 } # .insert / .select / .match / .primary
            "ui.selection" = { bg = gray_50 } # .primary
            "ui.selection.primary" = { bg = blue_40 }

            "ui.cursorline" = { bg = gray_20 }
            "ui.linenr" = gray_70
            "ui.linenr.selected" = gray_110

            "ui.popup" = { fg = gray_120, bg = gray_20 } # .info
            "ui.window" = { fg = gray_50 }
            "ui.help" = { fg = gray_120, bg = gray_20 }
            "ui.menu" = { fg = gray_120, bg = gray_20 } # .selected
            "ui.menu.selected" = { fg = white, bg = blue_40 } # .selected
            # Calculated as #ffffff with 30% opacity
            "ui.menu.scroll" = { fg = "#dfdfdf" }

            "ui.text" = gray_120 # .focus / .info
            "ui.text.focus" = { fg = white, bg = blue_40 }

            "ui.virtual" = gray_90 # .whitespace
            "ui.virtual.inlay-hint" = { fg = gray_70 }
            "ui.virtual.ruler" = { bg = gray_20 }

            "hint" = gray_80
            "info" = "#A366C4"
            "warning" = "#FACb66"
            "error" = "#FF5269"

            "diagnostic.hint" = { underline = { color = gray_80, style = "line" } }
            "diagnostic.info" = { underline = { color = "#A366C4", style = "line" } }
            "diagnostic.warning" = { underline = { color = "#FACB66", style = "line" } }
            "diagnostic.error" = { underline = { color = "#FF5269", style = "line" } }
            "diagnostic.unnecessary" = { modifiers = ["dim"] }
            "diagnostic.deprecated" = { modifiers = ["crossed_out"] }
        };
      };
    };
  };
}
