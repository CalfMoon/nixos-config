{ config, pkgs, inputs, ... }:
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
  };

  gtk = {
    enable = true;
    font.name = "JetBrains Mono";
    font.size = 12;
    catppuccin.icon.enable = true;
    theme.name = "catppuccin-mocha-green-standard+default";
  };
}
