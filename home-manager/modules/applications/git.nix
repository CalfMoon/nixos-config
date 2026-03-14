{ ... }: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Kritagya Bhattarai (CalfMoon)";
        email = "kritagyabhattarai@proton.me";
      };
      init.defaultBranch = "main";
    };
    signing = {
      signByDefault = false;
      key = "6200C8E7415347E0";
    };
  };
}
