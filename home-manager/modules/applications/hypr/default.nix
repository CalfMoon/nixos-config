{ ... }: {
  imports = [
    ./hyprland.nix
    ./hyprlock.nix
    ./hypridle.nix
  ];

  xdg.configFile."hypr/theme.conf".source = ./mocha.conf;
}
