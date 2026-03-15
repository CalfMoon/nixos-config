{ pkgs, ... }: {
  imports = [
    ./modules/packages.nix
    ./modules/display.nix
    ./modules/user.nix
    ./modules/services.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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


  networking.firewall.allowedTCPPorts = [ 8384 22000 53317 6600 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 53317 6600 ];
  networking.firewall.enable = false;


  fonts.fontconfig = {
    defaultFonts = {
      monospace = [ "JetBrains Mono NL" ];
      serif = [ "Roboto Serif" ];
      sansSerif = [ "Roboto" ];
    };
  };

  system.stateVersion = "24.05";
}
