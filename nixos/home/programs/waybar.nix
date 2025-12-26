{ config, pkgs, ... }: {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        width = 50;
        spacing = 0;
        margin-top = 15;
        margin-bottom = 15;
        margin-left = 15;
        margin-right = 10;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "hyprland/language"
          "pulseaudio"
          "memory"
          "clock"
          "tray"
        ];

        "hyprland/workspaces" = {
          format = "{id}";
          on-click = "activate";
          all-outputs = true;
          persistent-workspaces = {
            "1" = [ ];
          };
        };

        "hyprland/language" = {
          format = "{}";
          format-en = "EN";
          format-ru = "RU";
        };

        "hyprland/window" = {
          format = "{class}";
          rotate = 90;
        };

        "clock" = {
          format = "{:%H\n%M}";
          interval = 1;
        };

        "memory" = {
          format = "RAM\n{used:0.1f}";
        };

        "pulseaudio" = {
          format = "VOL\n{volume}%";
        };

        "tray" = {
          icon-size = 18;
          spacing = 10;
        };
      };
    };

    style = ''
      @define-color background #242933;
      @define-color foreground #eceff4;
      @define-color cyan       #88c0d0;
      @define-color blue       #81a1c1;
      @define-color magenta    #b48ead;
      @define-color green      #a3be8c;
      @define-color yellow     #ebcb8b;

      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font", sans-serif;
        font-size: 14px;
        color: @foreground;
        transition: all 0.2s ease;
      }

      window#waybar {
        background-color: rgba(36, 41, 51, 0.9);
        color: @foreground;
        border-radius: 3px;
        box-shadow: 0 0 7px 2px rgba(26, 26, 26, 0.93);
        margin: 5px;
      }

      #workspaces {
        margin-top: 5px;
      }

      #workspaces button {
        color: @foreground;
        padding: 2px 0;
      }

      #workspaces button.active {
        background: transparent;
        color: @cyan;
        font-size: 18px;
        font-weight: 900;
      }

      #clock, #memory, #pulseaudio, #language, #tray, #window {
        padding: 8px 0;
      }

      #clock { 
        color: @magenta; 
        font-size: 16px; 
        font-weight: bold; 
      }
      
      #language { 
        color: @blue; 
        font-weight: bold; 
      }
      
      #memory { 
        color: @green; 
        font-weight: bold; 
      }
      
      #pulseaudio { 
        color: @yellow; 
        font-weight: bold; 
      }
      
      #window { 
        font-weight: bold; 
      }

      #tray { 
        margin-bottom: 8px; 
      }
    '';
  };
}
