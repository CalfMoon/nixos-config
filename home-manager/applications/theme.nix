{ config, ... }:
{
  catppuccin = {
    accent = "green";
    flavor = "mocha";
  };

  catppuccin.pointerCursor.enable = true;

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
    style.catppuccin.enable = true;
    style.catppuccin.apply = false;
  };

  gtk = {
    enable = true;
    font.name = "JetBrains Mono";
    font.size = 12;
    catppuccin.icon.enable = true;
    catppuccin.enable = true;
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
    };
  };
}
