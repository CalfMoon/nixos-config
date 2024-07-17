{ ... }:
{
  imports = [
    ./applications/lf.nix
    ./applications/kitty.nix
    ./applications/zathura.nix
    ./applications/waybar.nix
    ./applications/hyprland.nix
    ./applications/dunst.nix
    ./applications/mpd.nix
    ./applications/theme.nix
    ./applications/mimeapps.nix
  ];

  home.username = "mooney";
  home.homeDirectory = "/home/mooney";

  home.file = { };

  programs = {
    git = {
      enable = true;
      userName = "Kritagya Bhattarai (CalfMoon)";
      userEmail = "kritagyabhattarai@proton.me";
      extraConfig.init.defaultBranch = "main";
    };
  };

  services.syncthing.enable = true;

  home.sessionVariables = { };

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
