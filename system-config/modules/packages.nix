{ pkgs, ... }: {
  services.flatpak.enable = true;

  virtualisation = {
    docker = {
      enable = true;
      package = pkgs.docker_28;
    };
  };
  users.users.mooney.extraGroups = [ "docker" ];
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

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

    # build stuff
    meson
    ninja
    gcc
    deno
    cmake
    gnumake
    go

    #programming stuff
    vscodium
    neovim

    luajitPackages.luarocks
    wget
    rustup
    python3
    jdk
    pipx
    nodePackages_latest.nodejs
    orca

    #general applications
    brave
    nur.repos.vieb-nix.vieb
    libreoffice
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
    heroic
    appimage-run
    prismlauncher
    steam
    protonup-qt
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
