{ ... }: {
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    syntaxHighlighting.catppuccin.enable = true;

    history.size = 0;
    dotDir = ".config/zsh/";

    shellAliases = {
      ls = "exa -al --color=always --group-directories-first";
      n = "neovim";

      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      config = "git - -git-dir=$XDG_DATA_HOME/dotfiles/ --work-tree=$HOME";
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
  };
}
