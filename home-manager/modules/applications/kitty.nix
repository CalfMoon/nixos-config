{ ... }: {
  programs.kitty = {
    enable = true;
    catppuccin.enable = true;

    font.name = "JetBrains Mono NL";
    font.size = 12;

    keybindings = {
      "ctrl+minus" = "change_font_size all -1.0";
      "ctrl+equal" = "change_font_size all +1.0";
    };

    settings = {
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      confirm_os_window_close = 0;

      window_margin_width = 0;

      placement_strategy = "center";
    };
  };
}
