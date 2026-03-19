{ config, pkgs, ... }: {
  home.file."${config.home.homeDirectory}/.local/share/script".source = ./script;

  home.packages = with pkgs; [
    opus-tools
    mpc
  ];
}
