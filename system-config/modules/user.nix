{ pkgs, ... }: {
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  nix.settings.allowed-users = [ "mooney" ];
  nix.settings.trusted-users = [ "mooney" ];

  users.users.mooney = {
    isNormalUser = true;
    description = "Kritagya Bhattarai";
    extraGroups = [ "networkmanager" "wheel" ];
    initialHashedPassword = "$y$j9T$fB5lbzmCYuIkgq4WGdAVR.$8CchBe0ua.fttEy0n5AdzfaPrf9EID/ckzLKeKDmgz9";
  };
}
