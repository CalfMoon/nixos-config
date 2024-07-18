{ ... }: {
  programs.git = {
    enable = true;
    userName = "Kritagya Bhattarai (CalfMoon)";
    userEmail = "kritagyabhattarai@proton.me";
    signing = {
      signByDefault = false;
      key = "6200C8E7415347E0";
    };
    extraConfig.init.defaultBranch = "main";
  };
}
