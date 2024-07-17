{ ... }:
{
  imports = [
    ./applications/lf.nix
    ./applications/kitty.nix
    ./applications/zathura.nix
    ./applications/waybar.nix
    ./applications/ncmpcpp.nix
    ./applications/hyprland.nix
    ./applications/git.nix
    ./applications/dunst.nix
    ./applications/mpd.nix
    ./applications/theme.nix
    ./applications/mimeapps.nix
  ];

  home.username = "mooney";
  home.homeDirectory = "/home/mooney";

  services.syncthing.enable = true;

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
