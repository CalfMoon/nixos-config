{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    #terminal utilities
    zip
    unzip
    unrar
    trash-cli
    (pass.withExtensions (ext: with ext; [ pass-otp ]))
    gnupg
    wl-clipboard
    pulsemixer
    calcurse
    fastfetch

    papirus-icon-theme

    # build stuff
    meson
    ninja
    gcc
    cmake
    gnumake

    #programming stuff
    vscodium
    neovim
    ripgrep
    luajitPackages.luarocks
    rustup
    python3
    nodePackages_latest.nodejs
    orca

    #general applications
    kitty
    brave
    libreoffice-fresh
    cinnamon.nemo
    pavucontrol
    localsend
    borgbackup
    pika-backup
    galculator
    freetube
    obsidian
    obs-studio
    spotube
    qbittorrent
    gimp
    qimgv
    mpv

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
