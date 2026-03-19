{ ... }: {
  programs.beets = {
    enable = true;
    settings = {
      original_date = "yes";
      directory = "~/Music/";
      import.move = true;

      plugins = [ "musicbrainz" "lastgenre" "advancedrewrite" "fetchart" "embedart" ];
      lastgenre = {
        source = "album";
        separator = "; ";
        count = 3;
        force = true;
      };
      fetchart = {
        auto = true;
        cover_format = "jpeg";
      };
      embedart.auto = true;
      advancedrewrite = [{ "albumartist Ye" = "Kanye"; }];
    };
  };
}
