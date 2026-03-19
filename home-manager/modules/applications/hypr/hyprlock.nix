{ ... }: {
  programs.hyprlock = {
    enable = true;
    settings = {
      source = "./theme.conf";

      "$accentColor" = "$green";
      "$accentAlpha" = "$greenAlpha";

      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };

      background = {
        monitor = "";
        blur_passes = 0;
        color = "$base";
      };

      label = [
        {
          monitor = "$mainMonitor";
          text = ''cmd[update:43200000] echo "$(date +"%A, %d %B %Y")"'';
          color = "$text";
          font_size = 25;
          font_family = "Jetbrains Mono NL";
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
        {
          monitor = "$mainMonitor";
          text = ''cmd[update:30000] echo "$(date +"%R")"'';
          color = "$text";
          font_size = 90;
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
      ];

      image = {
        monitor = "$mainMonitor";
        path = "$HOME/Pictures/pfp.png";
        size = 200;
        border_color = "$accentColor";

        position = "0, 75";
        halign = "center";
        valign = "center";
      };

      input-field = {
        monitor = "$mainMonitor";
        size = "300, 60";
        outline_thickness = 4;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = "$accentColor";
        inner_color = "$surface0";
        font_color = "$text";
        fade_on_empty = false;
        placeholder_text = ''<span foreground="##$textAlpha"><i>󰌾 Logged in as </i><span foreground="##$accentAlpha">$USER</span></span>'';
        hide_input = false;
        check_color = "$accent";
        fail_color = "$red";
        fail_text = ''<i>$FAIL <b>($ATTEMPTS)</b></i>'';
        capslock_color = "$yellow";
        position = "0, -80";
        halign = "center";
        valign = "center";
      };
    };
  };
}
