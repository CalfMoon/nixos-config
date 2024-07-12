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

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
    TERM = "kitty";
    BROWSER = "brave";
    FONT = "JetBrains Mono";
  };

  xdg.mimeApps.defaultApplications = {
    "text/plain" = [ "neovim.desktop" ];
    "application/pdf" = [ "zathura.desktop" ];
    "image/*" = [ "loupe.desktop" ];
  };

  services.syncthing.enable = true;

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
