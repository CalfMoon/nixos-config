{ ... }:
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

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kathmandu";
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.xkb.layout = "us";

  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [ "mooney" ];
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "mooney" ];
  virtualisation.virtualbox.host.enableExtensionPack = true;

  networking.firewall.allowedTCPPorts = [ 8384 22000 53317 6600 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 53317 6600 ];
  networking.firewall.enable = true;


  fonts.fontconfig = {
    defaultFonts = {
      monospace = [ "JetBrains Mono" ];
      serif = [ "Roboto Serif" ];
      sansSerif = [ "Roboto" ];
    };
  };

  system.stateVersion = "24.05";
}
