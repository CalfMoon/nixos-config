{ pkgs, ... }: {
  services.mpd = {
    enable = true;
    musicDirectory = /home/mooney/Music;
    playlistDirectory = /home/mooney/Music/.playlist;

    network.listenAddress = "any";
    network.startWhenNeeded = true;

    extraConfig = ''
      auto_update "yes"
      restore_paused "yes"
      bind_to_address "localhost"
      max_output_buffer_size "16384"

      audio_output {
              type "pipewire"
              name "PipeWire Sound Server"
      }

      audio_output {
          type "fifo"
          name "my_fifo"
          path "/tmp/mpd.fifo"
          format "44100:16:2"
      }
    '';
  };

  programs.ncmpcpp = {
    enable = true;
    bindings = [
      {
        key = "/";
        command = "find";
      }
      {
        key = "/";
        command = "find_item_forward";
      }

      {
        key = "=";
        command = "volume_up";
      }
      {
        key = "-";
        command = "volume_down";
      }

      {
        key = "j";
        command = "scroll_down";
      }
      {
        key = "k";
        command = "scroll_up";
      }

      {
        key = "ctrl-u";
        command = "page_up";
      }
      {
        key = "ctrl-d";
        command = "page_down";
      }

      {
        key = "h";
        command = "previous_column";
      }
      {
        key = "l";
        command = "next_column";
      }

      {
        key = ".";
        command = "show_lyrics";
      }

      {
        key = "n";
        command = "next_found_item";
      }
      {
        key = "N";
        command = "previous_found_item";
      }
    ];
    settings = {
      autocenter_mode = "yes";
      follow_now_playing_lyrics = "yes";
      ignore_leading_the = "yes";
      ignore_diacritics = "yes";
      default_place_to_search_in = "database";

      playlist_editor_display_mode = "columns";
      search_engine_display_mode = "columns";
      browser_display_mode = "columns";
      playlist_display_mode = "columns";

      ## General Colors ##
      colors_enabled = "yes";
      main_window_color = "white";
      header_window_color = "cyan";
      volume_color = "green";
      statusbar_color = "white";
      progressbar_color = "cyan";
      progressbar_elapsed_color = "white";

      ## Song List ##
      song_columns_list_format = "(10)[blue]{l} (30)[green]{t} (30)[magenta]{a} (30)[yellow]{b}";
      song_list_format = "{$7%a - $9}{$5%t$9}|{$5%f$9}$R{$6%b $9}{$3%l$9}";

      ## Current Item ##
      current_item_prefix = "$(green)$r";
      current_item_suffix = "$/r$(end)";
      current_item_inactive_column_prefix = "$(blue)$r";

      ## Alternative Interface ##
      user_interface = "alternative";
      alternative_header_first_line_format = "$0$aqqu$/a {$6%a$9 - }{$3%t$9}|{$3%f$9} $0$atqq$/a$9";
      alternative_header_second_line_format = "{$4%b {- %y}$9}";

      ## Classic Interface ##
      song_status_format = " $6%a $7⟫⟫ $3%t $7⟫⟫ $4%b ";

      ## Display Album artist insted of artist ##
      media_library_primary_tag = "album_artist";

      ## Visualizer ##
      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_output_name = "my_fifo";
      visualizer_in_stereo = "yes";
      visualizer_look = "◆▋";

      ## Navigation ##
      cyclic_scrolling = "yes";
      header_text_scrolling = "yes";
      jump_to_now_playing_song_at_start = "yes";
      lines_scrolled = "2";

      ## Other ##
      system_encoding = "utf-8";
      regular_expressions = "extended";

      ## Selected tracks ##
      selected_item_prefix = "* ";
      discard_colors_if_item_is_selected = "yes";

      ## Seeking ##
      incremental_seeking = "yes";
      seek_time = "1";

      ## Visibility ##
      header_visibility = "yes";
      statusbar_visibility = "yes";
      titles_visibility = "yes";

      ## Progress Bar ##
      progressbar_look = "=>-";

      ## Now Playing ##
      now_playing_prefix = "> ";
      centered_cursor = "yes";

      # Misc
      display_bitrate = "yes";
      enable_window_title = "yes";
      empty_tag_marker = "";

      # host
      mpd_host = "localhost";
      mpd_port = "6600";

      lyrics_directory = "~/.cache/ncmpcpp/lyrics";
      lyrics_fetchers = "genius, tekstowo, justsomelyrics, zeneszoveg, internet";

    };

  };

  programs.beets = {
    enable = true;
    settings = {
      original_date = "yes";
      plugins = [ "lastgenre" "web" ];
      lastgenre = {
        source = "album";
        count = 3;
      };
    };
  };

}
