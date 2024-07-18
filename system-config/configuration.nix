{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/packages.nix
    ./modules/display.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
  boot.kernelModules = [ "v4l2loopback" "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  boot.extraModprobeConfig = ''options v4l2loopback video_nr=0 exclusive_caps=1 card_label="Virtual Camera"'';
  boot.kernelParams = [ "nvidia_drm.modeset=1" "nvidia_drm.fbdev=1" "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];

  nix.settings.allowed-users = [ "mooney" ];

  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kathmandu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";

  services.printing.enable = true;
  services.printing.drivers = [ pkgs.cups-brother-hl1210w ];

  services.udisks2.enable = true;

  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  users.users.mooney = {
    isNormalUser = true;
    description = "Kritagya Bhattarai";
    extraGroups = [ "networkmanager" "wheel" ];
    initialHashedPassword = "test";
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.host.enable = true;

  networking.firewall.allowedTCPPorts = [ 8384 22000 53317 6600 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 53317 6600 ];
  networking.firewall.enable = true;

  system.stateVersion = "24.05";
}
