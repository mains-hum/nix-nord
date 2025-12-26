{ pkgs, ... }:

{
  home.packages = [ pkgs.gowall ];

  home.file.".config/gowall/config.yml".text = ''
    themes:
      - name: "nordic-void"
        colors:
          - "#242933"
          - "#3b4252"
          - "#434c5e"
          - "#4c566a"
          - "#d8dee9"
          - "#e5e9f0"
          - "#eceff4"
          - "#8fbcbb"
          - "#88c0d0"
          - "#81a1c1"
          - "#5e81ac"
          - "#bf616a"
          - "#d08770"
          - "#ebcb8b"
          - "#a3be8c"
          - "#b48ead"
          - "#5c6370"
          - "#4e5666"
          - "#373e4d"
          - "#1e222a"
          - "#191c24"
          - "#61afef"
          - "#c678dd"
          - "#98c379"
          - "#e06c75"
  '';
}
