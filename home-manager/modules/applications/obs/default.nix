{ pkgs, ... }: {
  xdg.configFile."obs-studio/themes".source = ./themes;
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      droidcam-obs
    ];
  };
}
