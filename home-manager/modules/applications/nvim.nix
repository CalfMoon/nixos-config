{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # lsp
    lua-language-server

    # formatter
    stylua

    # debugger
    vscode-extensions.vadimcn.vscode-lldb.adapter

    ripgrep
    gh
  ];
}
