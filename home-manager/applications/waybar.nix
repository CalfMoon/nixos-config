{ pkgs, ... }: {
  programs.waybar = {
    enable = true;
    settings = [
      {
        "output" = "DP-1";

        "include" = [ "~/.config/waybar/default-modules.json" ];

        "modules-center" = [
          "hyprland/workspaces"
        ];
        "modules-right" = [
          "clock"
        ];
      }
      {
        "output" = "HDMI-A-1";

        "include" = [ "~/.config/waybar/default-modules.json" ];

        "modules-left" = [
          "mpd"
          "tray"
        ];

        "modules-center" = [ "hyprland/workspaces" ];
        "modules-right" = [ "pulseaudio" "clock" ];
      }
    ];

    style = ''
      * {
        border: none;
        font-family: JetBrains Mono;
        font-size: 15px;
      }

      box.module {
        min-height: 10px;
      }

      window#waybar {
        background: transparent;
        color: #1e1e2e;
      }

      #clock,
      #pulseaudio,
      #mpd,
      #workspaces,
      #tray {
        padding: 0px 10px 0px 10px;
        border-radius: 10px;
      }

      #clock {
        background: #89b4fa;
      }

      #pulseaudio {
        background: #89dceb;
      }

      #pulseaudio.muted {
        color: #9399b2;
      }

      #mpd {
        background: #f38ba8;
      }

      #tray {
        background: #fab387;
      }

      #workspaces {
        background: #a6e3a1;
      }

      #workspaces button {
        color: #585b70;
      }

      #workspaces button.active {
        color: #45475a;
      }

      #workspaces button.urgent {
        color: #f38ba8;
      }
    '';
  };

  xdg.configFile."waybar/default-modules.json".text = ''
    {
        "margin": "6 6 0 6",
        "spacing": 6,

      "hyprland/workspaces": {
        "all-outputs": false,
        "warp-on-scroll": false,
        "format": "{icon}",
        "format-icons": {
          "urgent": "",
          "active": "",
          "default": "",
        }
      },
      "mpd": {
        "format": "{stateIcon} {artist} - {title} 󰝚",
        "format-disconnected": "Disconnected 󰝚",
        "format-stopped": "Stopped 󰝚",
        "unknown-tag": "N/A",
        "interval": 1,
        "state-icons": {
          "paused": "",
          "playing": "󰏤",
        },
        "tooltip-format": "MPD (connected)",
        "tooltip-format-disconnected": "MPD (disconnected)",
        "on-click": "${pkgs.mpc-cli}/bin/mpc toggle",
        "on-click-right": "$TERMINAL -e ${pkgs.ncmpcpp}/bin/ncmpcpp",
      },
      "clock": {
        "tooltip-format": "{:%Y %B}",
        "format": "{:%I:%M %p}",
        "format-alt": "{:%a - %b %d, %Y}",
        "on-click-right": "$TERMINAL -e ${pkgs.calcurse}/bin/calcurse",
      },
      "pulseaudio": {
        "scroll-step": 1,
        "format": "{volume}% {icon}",
        "format-muted": "{volume}% 󰓄",
        "format-icons": {
          "default": ["󰓃"],
        },
        "on-click": "${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle",
        "on-click-right": "$TERMINAL -e ${pkgs.pulsemixer}/bin/pulsemixer",
      },
      "tray": {
        "icon-size": 20,
        "spacing": 5,
      },
    }
  '';


}
