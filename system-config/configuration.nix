{ config, pkgs, inputs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
  boot.kernelModules = [ "v4l2loopback" "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  boot.extraModprobeConfig = ''options v4l2loopback video_nr=0 exclusive_caps=1 card_label="Virtual Camera"'';
  boot.kernelParams = [ "nvidia_drm.modeset=1" "nvidia_drm.fbdev=1" ];

  nix.settings.allowed-users = [ "mooney" ];

  # Bootloader.
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
    catppuccin.enable = true;
  };

  console = {
    catppuccin.enable = true;
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kathmandu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver = {
    enable = true;
    desktopManager.budgie.enable = true;
  };

  environment.budgie.excludePackages = with pkgs; [
    gnome-terminal
    mate.atril
    mate.mate-calc
    mate.eom
    mate.pluma
    mate.engrampa
    vlc
    xterm
  ];

  catppuccin = {
    flavor = "mocha";
    accent = "green";
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    catppuccin = {
      enable = true;
      font = "JetBrains Mono";
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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };


  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.cups-brother-hl1210w ];

  services.udisks2.enable = true;

  services.hypridle.enable = true;

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };


  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;

  users.users.mooney = {
    isNormalUser = true;
    description = "Kritagya Bhattarai";
    extraGroups = [ "networkmanager" "wheel" ];
    initialHashedPassword = "test";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    mpd
    zip
    unzip
    unrar
    trash-cli
    pulseaudio
    mpc-cli
    (pass.withExtensions (ext: with ext; [ pass-otp ]))
    gnupg
    papirus-icon-theme
    udiskie
    atuin
    wl-clipboard
    meson
    ninja
    gcc
    cmake
    gnumake
    rustup
    handlr

    vscodium
    neovim
    ripgrep
    git
    orca
    luajitPackages.luarocks
    python3
    nodejs_22


    waybar
    waypaper
    swww
    dunst
    rofi-wayland
    grimblast

    ncmpcpp
    btop
    lf
    ctpv
    eza
    pulsemixer
    pavucontrol
    bat
    calcurse
    fastfetch
    hyprpicker
    syncthing

    zathura
    kitty
    brave
    libreoffice-fresh
    cinnamon.nemo
    localsend
    borgbackup
    pika-backup
    galculator
    loupe
    freetube
    obsidian
    obs-studio
    spotube
    qbittorrent
    gimp
    virtualbox

    wine
    lutris
    gamescope
    steam
    protonup-qt
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.zsh.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 8384 22000 53317 6600 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 53317 6600 ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
