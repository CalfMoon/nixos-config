{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    mpd
    zip
    unzip
    unrar
    trash-cli
    pulseaudio
    (pass.withExtensions (ext: with ext; [ pass-otp ]))
    gnupg
    papirus-icon-theme
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

    waypaper
    rofi-wayland

    ncmpcpp
    btop
    lf
    eza
    pulsemixer
    pavucontrol
    bat
    calcurse
    fastfetch
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

    wine
    lutris
    gamescope
    steam
    protonup-qt
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
  ];
}
