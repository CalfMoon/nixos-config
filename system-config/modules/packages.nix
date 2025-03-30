{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    #terminal utilities
    zip
    unzip
    unrar
    trash-cli
    (pass.withExtensions (ext: with ext; [ pass-otp ]))
    wl-clipboard
    xclip
    pulsemixer
    calcurse
    fastfetch

    tailscale

    papirus-icon-theme

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
    rustup
    python3
    pipx
    nodePackages_latest.nodejs
    orca

    #general applications
    kitty
    brave
    libreoffice
    nemo
    pavucontrol
    localsend
    borgbackup
    pika-backup
    gparted
    galculator
    obsidian
    nur.repos.nltch.spotify-adblock
    qbittorrent
    nicotine-plus
    gimp
    qimgv
    sqlite
    sqlitestudio
    plattenalbum

    #gaming
    wine
    lutris
    steam
    protonup-qt
    ryujinx
    libgudev
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    roboto-serif
    roboto
  ];
}
