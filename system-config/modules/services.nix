{ pkgs, ... }: {
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.cups-brother-hl1210w ];

  services.udisks2.enable = true;

  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-gtk2;
  };

  programs.nix-ld.enable = true;

  services.openssh.enable = true;
  services.openssh.settings = {
    PasswordAuthentication = false;
    PermitRootLogin = "no";
    AllowUsers = [ "mooney" ];
    Port = 22;
  };
}
