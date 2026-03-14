{ pkgs, inputs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];

  catppuccin = {
    flavor = "mocha";
    accent = "green";
    tty.enable = true;
    grub.enable = true;
    sddm = {
      enable = true;
      font = "Roboto";
      fontSize = "12";
    };
  };

  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = false;
  boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    useOSProber = true;
    efiSupport = true;
    gfxmodeEfi = "1920x1080";
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
  };

  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      xwayland.enable = true;
    };
  };

  services.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = (with pkgs; [
    atomix # puzzle game
    cheese # webcam tool
    epiphany # web browser
    evince # document viewer
    geary # email reader
    gedit # text editor
    gnome-characters
    gnome-calculator
    gnome-calendar
    gnome-clocks
    gnome-connections
    gnome-music
    gnome-photos
    gnome-terminal
    gnome-text-editor
    gnome-weather
    gnome-maps
    gnome-user-docs
    simple-scan
    gnome-console
    gnome-contacts
    gnome-disk-utility
    papers
    gnome-tour
    decibels
    snapshot
    hitori # sudoku game
    iagno # go game
    tali # poker game
    totem # video player
  ]);

  services.gnome.rygel.enable = false;
}
