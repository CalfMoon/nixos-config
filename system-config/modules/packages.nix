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
    cargo
    python3
    pipx
    nodePackages_latest.nodejs
    orca

    #general applications
    kitty
    brave
    libreoffice-fresh
    nemo
    pavucontrol
    localsend
    borgbackup
    pika-backup
    galculator
    freetube
    obsidian
    spotube
    element-desktop
    qbittorrent
    gimp
    qimgv

    #gaming
    wine
    lutris
    gamescope
    steam
    protonup-qt
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    roboto-serif
    roboto
  ];
}
