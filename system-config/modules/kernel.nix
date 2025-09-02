{ pkgs, config, ... }: {
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
  boot.kernelModules = [ "v4l2loopback" "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  boot.extraModprobeConfig = ''options v4l2loopback video_nr=0 exclusive_caps=1 card_label="Virtual Camera"'';
  boot.kernelParams = [ "nvidia_drm.modeset=1" "nvidia_drm.fbdev=1" "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];
   security.polkit.enable = true;
}
