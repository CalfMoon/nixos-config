{ ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixDesktop";

  nix.settings = {
    cores = 4;
    max-jobs = 1;
  };
}
