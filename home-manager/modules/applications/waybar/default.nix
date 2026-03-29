{ pkgs, ... }: {
  # packages used in default-modules
  home.packages = with pkgs; [
    mpc
    ncmpcpp
    calcurse
    pulseaudio
    pulsemixer
  ];
  xdg.configFile."waybar/default-modules.json".source = ./default-modules.json;

  programs.waybar = {
    enable = true;
    style = ./style.css;

    settings = [
      {
        "output" = "DP-1";

        "include" = [ "~/.config/waybar/default-modules.json" ];

        "modules-left" = [ "mpd" ];
        "modules-center" = [ "hyprland/workspaces" ];
        "modules-right" = [ "pulseaudio" "clock" ];
      }
      {
        "output" = "HDMI-A-1";

        "include" = [ "~/.config/waybar/default-modules.json" ];

        "modules-left" = [ "mpd" "tray" ];
        "modules-center" = [ "hyprland/workspaces" ];
        "modules-right" = [ "pulseaudio" "clock" ];
      }
    ];
  };
}

