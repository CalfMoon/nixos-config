{ pkgs, lib, ... }:
{
  home.packages = [ pkgs.libnotify ];
  programs.zsh = {
    enable = true;
    syntaxHighlighting = {
      enable = true;
      catppuccin.enable = true;
    };

    history.size = 0;
    dotDir = ".config/zsh/";

    shellAliases = {
      ls = "${pkgs.eza}/bin/exa -al --color=always --group-directories-first";
      cat = "${pkgs.bat}/bin/bat";
      nix-shell = "nix-shell --run zsh";
      e = "$EDITOR";

      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      config = "git --git-dir=$XDG_DATA_HOME/dotfiles/ --work-tree=$HOME";
      capSwap = "setxkbmap -option 'ctrl:swapcaps'";
    };
    plugins = [{
      name = "auto-notify";
      src = pkgs.fetchFromGitHub {
        owner = "MichaelAquilina";
        repo = "zsh-auto-notify";
        rev = "0.10.1";
        sha256 = "sha256-l5nXzCC7MT3hxRQPZv1RFalXZm7uKABZtfEZSMdVmro=";
      };
    }];
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    catppuccin.enable = true;
    settings = {
      add_newline = false;

      format = lib.concatStrings [
        "$directory"
        "$git_branch"
        "$git_status"
        "$character"
      ];
    };
  };
}
