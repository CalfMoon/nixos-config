{ pkgs, ... }: {
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  nix.settings.allowed-users = [ "mooney" ];

  users.users.mooney = {
    isNormalUser = true;
    description = "Kritagya Bhattarai";
    extraGroups = [ "networkmanager" "wheel" ];
    initialHashedPassword = "test";
  };
}
