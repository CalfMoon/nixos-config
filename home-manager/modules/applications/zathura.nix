{ ... }: {
  programs.zathura = {
    enable = true;
    catppuccin.enable = true;

    mappings = {
      "<C-i>" = "recolor";
    };

    options = {
      selection-clipboard = "clipboard";
    };
  };
}
