{ ... }: {
  programs.btop = {
    enable = true;
    settings = {
      vim_keys = true;
      update_ms = 1000;
      proc_tree = true;
    };
  };
  catppuccin.btop.enable = true;
}
