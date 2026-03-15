{ ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [ "HDMI-A-1,1920x1080@60,1366x0,1" "DP-1,1366x768@60,0x312,1" ];

      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "NIXOS_OZONE_WL,1"
        "NVD_BACKEND,direct"
      ];

      animations = {
        enabled = true;
        bezier = "myBezier, 0, 0, 0, 0";
        animation = [
          "windows, 1, 2, myBezier, slide"
          "windowsOut, 1, 2, myBezier, slide"
          "fade, 1, 2, myBezier"
          "workspaces, 1, 2, myBezier"
          "specialWorkspace, 1, 2, myBezier, slidevert"
        ];
      };
    };
  };

  programs.hyprlock = {
    settings = {
      "$mainMonitor" = "HDMI-A-1";
    };
  };
}
