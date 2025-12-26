{ config, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };

    settings = {
      shell = "fish";
      window_padding_width = 0;
      background_opacity = "0.95";
      background_blur = 1;
      enable_audio_bell = false;

      foreground            = "#eceff4";
      background            = "#242933";
      selection_foreground  = "#eceff4";
      selection_background  = "#4c566a";
      url_color             = "#88c0d0";
      cursor                = "#88c0d0";
      cursor_text_color     = "#242933";

      color0 = "#242933";
      color8 = "#4c566a";

      color1 = "#bf616a";
      color9 = "#bf616a";

      color2  = "#a3be8c";
      color10 = "#a3be8c";

      color3  = "#ebcb8b";
      color11 = "#ebcb8b";

      color4  = "#81a1c1";
      color12 = "#81a1c1";

      color5  = "#b48ead";
      color13 = "#b48ead";

      color6  = "#88c0d0";
      color14 = "#8fbcbb";

      color7  = "#e5e9f0";
      color15 = "#eceff4";
    };

    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+plus" = "change_font_size all +1";
      "ctrl+equal" = "change_font_size all +1";
      "ctrl+kp_add" = "change_font_size all +1";
      "ctrl+minus" = "change_font_size all -1";
      "ctrl+underscore" = "change_font_size all -1";
      "ctrl+kp_subtract" = "change_font_size all -1";
      "ctrl+0" = "change_font_size all 0";
      "ctrl+kp_0" = "change_font_size all 0";
    };

    extraConfig = ""; 
  };
}
