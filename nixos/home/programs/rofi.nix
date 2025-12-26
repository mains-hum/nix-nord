{ config, pkgs, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    extraConfig = {
      modi = "drun,run,window";
      icon-theme = "Papirus-Dark";
      show-icons = true;
      terminal = "alacritty";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = " 󰕰  Window ";
      sidebar-mode = true;
    };

    theme = {
      "*" = {
        bg0 = mkLiteral "#242933";
        bg1 = mkLiteral "#3b4252";
        fg0 = mkLiteral "#eceff4";
        accent = mkLiteral "#88c0d0";
        blue = mkLiteral "#81a1c1";
        
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@fg0";
        font = "JetBrainsMono Nerd Font 12";
      };

      "window" = {
        width = mkLiteral "700px";
        height = mkLiteral "500px";
        border = mkLiteral "0px";
        border-radius = mkLiteral "3px";
        background-color = mkLiteral "rgba(36, 41, 51, 0.93)";
      };

      "mainbox" = {
        padding = mkLiteral "20px";
        children = map mkLiteral [ "inputbar" "listview" "mode-switcher" ];
      };

      "inputbar" = {
        background-color = mkLiteral "rgba(59, 66, 82, 0.7)";
        border-radius = mkLiteral "3px";
        margin = mkLiteral "0px 0px 15px 0px";
        padding = mkLiteral "5px";
        children = map mkLiteral [ "prompt" "entry" ];
      };

      "prompt" = {
        background-color = mkLiteral "@accent";
        padding = mkLiteral "10px 15px";
        text-color = mkLiteral "@bg0";
        border-radius = mkLiteral "3px";
        font = "JetBrainsMono Nerd Font Bold 12";
      };

      "entry" = {
        padding = mkLiteral "10px";
        placeholder = "Search apps...";
        placeholder-color = mkLiteral "rgba(236, 239, 244, 0.2)";
      };

      "listview" = {
        columns = 2;
        lines = 7;
        spacing = mkLiteral "8px";
        margin = mkLiteral "10px 0px";
        background-color = mkLiteral "transparent";
      };

      "element" = {
        padding = mkLiteral "10px";
        border-radius = mkLiteral "3px";
        background-color = mkLiteral "transparent";
      };

      "element selected" = {
        background-color = mkLiteral "rgba(136, 192, 208, 0.2)";
        text-color = mkLiteral "@accent";
      };

      "element-icon" = {
        size = mkLiteral "32px";
        margin = mkLiteral "0 15px 0 0";
        background-color = mkLiteral "transparent";
      };

      "element-text" = {
        vertical-align = mkLiteral "0.5";
        text-color = mkLiteral "inherit";
        background-color = mkLiteral "transparent";
      };

      "mode-switcher" = {
        spacing = 15;
      };

      "button" = {
        padding = mkLiteral "10px";
        background-color = mkLiteral "rgba(59, 66, 82, 0.5)";
        text-color = mkLiteral "@blue";
        border-radius = mkLiteral "3px";
      };

      "button selected" = {
        background-color = mkLiteral "@accent";
        text-color = mkLiteral "@bg0";
      };
    };
  };
}
