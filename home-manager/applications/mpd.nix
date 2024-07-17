{ ... }: {
  services.mpd = {
    enable = true;
    musicDirectory = /home/mooney/Music;
    playlistDirectory = /home/mooney/Music/.playlist;

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
}
