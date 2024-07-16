{ pkgs, ... }:
{
  imports = [ ./applications/hyprland.nix ./applications/theme.nix ./applications/lf.nix ./applications/mimeapps.nix ./applications/dunst.nix ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "mooney";
  home.homeDirectory = "/home/mooney";

  home.packages = with pkgs; [
  ];

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
