{ pkgs, inputs, ... }: {
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
      font = "Jetbrains Mono NL";
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
    wayland.enable = false;
    theme = "catppuccin-mocha-green";
    package = pkgs.kdePackages.sddm;
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
  };

  services.desktopManager.cosmic.enable = true;
  environment.cosmic.excludePackages = (with pkgs; [
    cosmic-edit
    cosmic-term
    cosmic-store
    cosmic-player
    cosmic-reader
  ]);

  services.gnome.rygel.enable = false;
}
