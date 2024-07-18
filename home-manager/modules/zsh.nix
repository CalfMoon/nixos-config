{ pkgs, lib, ... }: {
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
      cat = "${pkgs.bat}/bat";
      e = "$EDITOR";

      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      config = "git --git-dir=$XDG_DATA_HOME/dotfiles/ --work-tree=$HOME";
      capSwap = "setxkbmap -option 'ctrl:swapcaps'";
    };
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    catppuccin.enable = true;
    enableZshIntegration = true;
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
