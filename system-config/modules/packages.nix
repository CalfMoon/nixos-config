{ pkgs, inputs, ... }: {
  services.flatpak.enable = true;

  virtualisation = {
    docker = {
      enable = true;
      package = pkgs.docker;
    };
  };
  users.users.mooney.extraGroups = [ "docker" ];
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  nixpkgs.config.permittedInsecurePackages = [
    "ventoy-1.1.18"
  ];

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    #virtualization
    qemu

    #terminal utilities
    zip
    unzip
    unrar
    trash-cli
    (pass.withExtensions (ext: with ext; [ pass-otp ]))
    wl-clipboard
    xclip
    calcurse
    fastfetch
    ventoy-full

    # build stuff
    meson
    ninja
    gcc
    cmake
    wget
    gnumake
    gradle_9

    #programming stuff
    vscodium
    neovim
    neovide
    android-studio

    luajitPackages.luarocks
    nodejs_24
    rustup
    python3
    pipx
    jdk
    kotlin

    #general applications
    brave
    tor-browser
    libreoffice
    readest
    calibre
    nautilus
    pavucontrol
    localsend
    borgbackup
    pika-backup
    gparted
    obsidian
    qbittorrent
    nicotine-plus
    gimp
    qimgv
    sqlite
    sqlitestudio
    plattenalbum
    papirus-icon-theme
    lxqt.lxqt-policykit

    #gaming
    wine
    lutris
    # heroic
    appimage-run
    prismlauncher
    steam

    protonup-qt
    steamtinkerlaunch
    ryubing
    libgudev
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    roboto-serif
    roboto
    font-awesome
  ];
}
