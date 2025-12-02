{ config, ... }: {
  home.file."${config.home.homeDirectory}/.local/share/script".source = ./scripts;
}
