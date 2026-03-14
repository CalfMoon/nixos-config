{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # lsp
    lua-language-server
    rustup
    wget

    # formatter
    stylua

    # debugger
    vscode-extensions.vadimcn.vscode-lldb.adapter

    ripgrep
    gh
  ];
}
