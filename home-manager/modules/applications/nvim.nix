{ pkgs, ... }: {
  home.packages = with pkgs; [
    # for rust formatter and language server
    rustup

    # for telescope
    ripgrep

    # for github plugins
    gh

    # build lazy packages
    # dbee
    wget
    # telescope-fzf-native
    gnumake
    # Markdown preview
    deno

    # build mason packages
  ];
}
