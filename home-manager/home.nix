{ config, pkgs, inputs,  ... }:
{
  imports = [ ./applications/hyprland.nix ];
# Home Manager needs a bit of information about you and the paths it should
# manage.
  home.username = "mooney";
  home.homeDirectory = "/home/mooney";

  home.stateVersion = "24.05"; # Please read the comment before changing.

    home.packages = with pkgs; [
    ];


# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
  home.file = {
  };

  programs =  {
    git = {
      enable = true;
      userName = "Kritagya Bhattarai (CalfMoon)";
      userEmail = "kritagyabhattarai@proton.me";
    };
  };

  home.sessionVariables = {
# EDITOR = "emacs";
  };

  xdg.mimeApps.defaultApplications = {
    "text/plain" = ["neovim.desktop"];
    "application/pdf" = ["zathura.desktop"];
    "image/*" = ["loupe.desktop"];
  };

  services.syncthing.enable = true;

  qt={
    enable = true;
    platformTheme.name = "gtk";
    style.name = "catppuccin-mocha";
    style.package = pkgs.catppuccin-qt5ct;
  };

  programs.home-manager.enable = true;
}
