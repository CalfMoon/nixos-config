{ config, ... }:
{
  catppuccin = {
    accent = "green";
    flavor = "mocha";
  };

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
    style.catppuccin.enable = true;
    style.catppuccin.apply = false;
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    size = 24;
  };
  catppuccin.pointerCursor.enable = true;

  gtk = {
    enable = true;
    font.name = "Roboto";
    font.size = 12;
    catppuccin.enable = true;
    catppuccin.icon.enable = true;
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
  };

  programs = {
    bat = {
      enable = true;
      catppuccin.enable = true;
    };

    btop = {
      enable = true;
      catppuccin.enable = true;
      settings = {
        vim_keys = true;
        update_ms = 1000;
        proc_tree = true;

      };
    };
  };
}
