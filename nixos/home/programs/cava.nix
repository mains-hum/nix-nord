{ config, pkgs, ... }:

{
  programs.cava = {
    enable = true;
    settings = {
      general = {
        framerate = 60;
        autosens = 1;
        bars = 0;
        bar_width = 2;
        bar_spacing = 1;
      };

      smoothing = {
        integral = 77;
        monstercat = 1;
      };

      color = {
        gradient = 1;
        gradient_count = 6;

        gradient_color_1 = "'#81a1c1'";
        gradient_color_2 = "'#88c0d0'";
        gradient_color_3 = "'#8fbcbb'";
        gradient_color_4 = "'#a3be8c'";
        gradient_color_5 = "'#ebcb8b'";
        gradient_color_6 = "'#bf616a'";
      };
    };
  };
}
