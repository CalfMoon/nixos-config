# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/d49b2a70-cc8f-470a-b250-f0a8474cdae9";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/1706-AD1B";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/14ddb20f-48a0-4595-bbb7-e44576558746";
      fsType = "ext4";
    };

  fileSystems."/home/mooney/Games" =
    {
      device = "/dev/disk/by-uuid/8a775a03-9ccf-425f-9826-406f5c5da7e7";
      fsType = "ext4";
    };

  fileSystems."/home/mooney/Games/torrent" =
    {
      device = "/dev/disk/by-uuid/58ab5352-e6f9-4db5-8ab2-e341c0af479e";
      fsType = "ext4";
    };

  fileSystems."/home/mooney/VMs" =
    {
      device = "/dev/disk/by-uuid/ed295177-c3af-444f-b60e-4c4fe1bff1db";
      fsType = "ext4";
    };

  fileSystems."/home/mooney/Backups" =
    {
      device = "/dev/disk/by-uuid/04154651-0543-4d13-8b0e-cf423eede4f6";
      fsType = "ext4";
    };

  swapDevices = [{ device = "/dev/disk/by-uuid/00753600-bf98-44c1-b90a-73e38798bfb8"; }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
