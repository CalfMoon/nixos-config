{ ... }:
{
  imports = [
    ./modules/applications/bat.nix
    ./modules/applications/btop.nix
    ./modules/applications/dunst.nix
    ./modules/applications/git.nix
    ./modules/applications/hyprland.nix
    ./modules/applications/kitty.nix
    ./modules/applications/lf.nix
    ./modules/applications/mpv.nix
    ./modules/applications/music.nix
    ./modules/applications/nvim.nix
    ./modules/applications/obs.nix
    ./modules/applications/rofi.nix
    ./modules/applications/zathura.nix
    ./modules/applications/waybar.nix

    ./modules/enviroment-variable.nix
    ./modules/zsh.nix
    ./modules/theme.nix
    ./modules/mimeapps.nix
  ];

  home.username = "mooney";
  home.homeDirectory = "/home/mooney";

  services.syncthing.enable = true;

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
