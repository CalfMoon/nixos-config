{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lua-language-server
    bash-language-server
    nil
    typescript
    typescript-language-server
    vscode-langservers-extracted
    emmet-ls
    pyright

    stylua
    shfmt
    nixpkgs-fmt
    nodePackages_latest.prettier
    rubyPackages.htmlbeautifier
    black
    rustfmt

    clippy

    ripgrep
    gh
  ];
}
