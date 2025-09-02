{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/packages.nix
    ./modules/display.nix
    ./modules/display-drivers.nix
    ./modules/kernel.nix
    ./modules/user.nix
    ./modules/services.nix
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    cores = 4;
    max-jobs = 1;
  };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  security.polkit.enable = true;
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  time.timeZone = "Asia/Kathmandu";
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.xkb.layout = "us";

  virtualisation = {
    docker = {
      enable = true;
      package = pkgs.docker_28;
    };
  };
  users.users.mooney.extraGroups = [ "docker" ];


  environment.systemPackages = with pkgs; [ qemu lxqt.lxqt-policykit ];
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  networking.firewall.allowedTCPPorts = [ 8384 22000 53317 6600 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 53317 6600 ];
  networking.firewall.enable = false;


  fonts.fontconfig = {
    defaultFonts = {
      monospace = [ "JetBrains Mono" ];
      serif = [ "Roboto Serif" ];
      sansSerif = [ "Roboto" ];
    };
  };

  services.flatpak.enable = true;

  system.stateVersion = "24.05";
}
