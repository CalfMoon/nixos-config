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
  };

  console = {
    catppuccin.enable = true;
  };

  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
    gfxmodeEfi = "1920x1080";
    catppuccin.enable = true;
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    catppuccin = {
      enable = true;
      font = "Roboto";
      fontSize = "12";
    };
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

  services.xserver.desktopManager.budgie.enable = true;
  environment.budgie.excludePackages = with pkgs; [
    gnome-terminal
    mate.atril
    mate.mate-calc
    mate.eom
    mate.pluma
    mate.engrampa
    vlc
  ];
  services.gnome.rygel.enable = false;
}
