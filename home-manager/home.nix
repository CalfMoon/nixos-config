{ pkgs, ... }:
{
  imports = [ ./applications/hyprland.nix ./applications/theme.nix ];
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

  xdg.mime.enable = true;
  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "text/*" = [ "nvim.desktop" ];
    "image/*" = [ "org.gnome.Loupe.desktop" ];

    "application/pdf" = [ "org.pwmt.zathura-pdf-mupdf.desktop" ];
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
