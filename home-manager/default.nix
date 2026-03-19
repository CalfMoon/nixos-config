{ ... }: {
  imports = [
    ./modules/applications

    ./modules/scripts
    ./modules/enviroment-variable.nix
    ./modules/zsh.nix
    ./modules/theme.nix
    ./modules/mimeapps.nix
  ];

  home.username = "mooney";
  home.homeDirectory = "/home/mooney";

  services.syncthing.enable = true;

  services.udiskie = {
    enable = true;
    notify = false;
  };

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
