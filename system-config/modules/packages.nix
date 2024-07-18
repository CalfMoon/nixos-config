{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    zip
    unzip
    unrar
    trash-cli
    (pass.withExtensions (ext: with ext; [ pass-otp ]))
    gnupg
    papirus-icon-theme
    wl-clipboard
    meson
    ninja
    gcc
    cmake
    gnumake
    rustup

    vscodium
    neovim
    ripgrep
    git
    orca
    luajitPackages.luarocks
    python3
    nodejs_22

    ncmpcpp
    btop
    lf
    eza
    pulsemixer
    pavucontrol
    bat
    calcurse
    fastfetch

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
