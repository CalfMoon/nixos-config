{ ... }: {
  programs.zathura = {
    enable = true;

    mappings = {
      "<C-i>" = "recolor";
    };

    options = {
      selection-clipboard = "clipboard";
    };
  };
  catppuccin.zathura.enable = true;
}
