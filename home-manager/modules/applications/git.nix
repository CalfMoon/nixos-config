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
      key = "0E548339B75F8117";
    };
  };
}
