{ pkgs, config, ... }:
{
  catppuccin = {
    accent = "green";
    flavor = "mocha";
  };

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  catppuccin.kvantum.enable = true;
  catppuccin.kvantum.apply = false;

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    size = 24;
  };
  catppuccin.cursors.enable = true;

  gtk = {
    enable = true;
    font.name = "Roboto";
    font.size = 12;
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    theme = {
      name = "Catppuccin-GTK-Green-Dark";
      package = pkgs.magnetic-catppuccin-gtk.override {
        accent = ["green"];
        size = "standard";
        tweaks = [ "black" ];
      };
    };
  };

  catppuccin.gtk.icon.enable = true;
}
