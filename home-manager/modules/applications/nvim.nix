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
    rust-analyzer
    pyright

    stylua
    shfmt
    nixpkgs-fmt
    nodePackages_latest.prettier
    rubyPackages.htmlbeautifier
    black
    rustfmt

    ripgrep
    gh
  ];
}
