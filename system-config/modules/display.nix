{ config, pkgs, inputs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.enable = true;

  services.xserver.excludePackages = [ pkgs.xterm ];

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

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
