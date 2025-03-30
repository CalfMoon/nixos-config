{ pkgs, ... }: {
  services.dunst = {
    enable = true;

    iconTheme.package = pkgs.papirus-icon-theme;
    iconTheme.name = "Papirus";

    settings = {
      urgency_critical = {
        frame_color = "#FAB387";
      };

      global = {
        follow = "keyboard";
        width = 300;
        height = "(0,300)";
        origin = "top-right";
        offset = "(6,6)";
        scale = 0;
        notification_limit = 2;
        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        progress_bar_corner_radius = 0;
        indicate_hidden = "yes";
        transparency = 0;
        separator_height = 1;
        padding = 8;
        horizontal_padding = 8;
        text_icon_padding = 0;
        frame_width = 3;
        frame_color = "#a6e3a1";
        background = "#1E1E2E";
        foreground = "#CDD6F4";
        gap_size = 5;
        separator_color = "frame";
        sort = "yes";
        font = "Roboto 12";
        line_height = 0;
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = "yes";
        enable_recursive_icon_lookup = true;

        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 50;
        icon_corner_radius = 25;

        sticky_history = "yes";
        history_length = 20;

        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 8;
        ignore_dbusclose = false;
        mouse_left_click = "close_current";
        mouse_middle_click = "do_action, close_current";
        mouse_right_click = "close_all";
      };
    };
  };
}
