{ pkgs, inputs, ... }:
{
  xdg.configFile."hypr/theme.conf".source = ./mocha.conf;

  wayland.windowManager.hyprland = {
    plugins = [ inputs.split-monitor-workspaces.packages.${pkgs.stdenv.hostPlatform.system}.split-monitor-workspaces ];
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    enable = true;
    settings = {
      source = [ "./theme.conf" "./monitor.conf" ];

      "$accentColor" = "$green";
      "$accentAlpha" = "$greenAlpha";

      exec-once = [
        "${pkgs.swww}/bin/swww-daemon --format xrgb & ${pkgs.waybar}/bin/waybar & ${pkgs.udiskie}/bin/waybar & ${pkgs.hypridle}/bin/hypridle"
        "qbittorrent"
      ];

      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "NIXOS_OZONE_WL,1"
        "NVD_BACKEND,direct"
      ];

      input = {
        kb_layout = "us";

        follow_mouse = 0;

        kb_options = "ctrl:swapcaps";

        touchpad = {
          natural_scroll = "no";
        };

        sensitivity = 0;
      };

      general = {
        gaps_in = 3;
        gaps_out = 6;
        border_size = 3;
        "col.active_border" = "$accentColor";
        "col.inactive_border" = "$overlay0";

        layout = "dwindle";

        allow_tearing = false;
      };


      decoration = {
        rounding = 8;

        blur = {
          enabled = false;
          size = 3;
          passes = 1;
        };

        drop_shadow = false;

        dim_inactive = true;
        dim_strength = 0.2;
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0, 0, 0, 0";
        animation = [
          "windows, 1, 3, myBezier, slide"
          "windowsOut, 1, 3, myBezier, popin 20%"
          "fade, 1, 3, myBezier"
          "workspaces, 1, 3, myBezier"
          "specialWorkspace, 1, 3, myBezier, slidevert"
        ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = true;
        default_split_ratio = 1;

        force_split = 2;
      };

      misc = {
        force_default_wallpaper = 0;
        focus_on_activate = false;
        mouse_move_focuses_monitor = false;

        enable_swallow = true;
        swallow_regex = "^($TERMINAL)$";
      };

      debug = {
        disable_logs = false;
      };

      windowrulev2 = "suppressevent maximize, class:.*"; # You'll probably like this.

      "$mainMod" = "SUPER";


      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bind = [
        "$mainMod, Q, killactive"

        # most used applications
        "$mainMod, Return, exec, $TERMINAL"
        "$mainMod SHIFT, Return, exec, $EDITOR"
        "$mainMod CTRL, Return, exec, $BROWSER"

        # terminal based applications
        "$mainMod, O, exec, $TERMINAL -e ${pkgs.ncmpcpp}/bin/ncmpcpp"
        "$mainMod, P, exec, $TERMINAL -e ${pkgs.btop}/bin/btop"
        "$mainMod, C, exec, ${pkgs.hyprpicker}/bin/hyprpicker -a"

        #rofi menus
        "$mainMod, D, exec, exec launcher"
        "$mainMod, R, exec, exec runner"
        "$mainMod, M, exec, exec powermenu"

        #screenshot
        "$mainMod, S, exec, ${pkgs.grimblast}/bin/grimblast copy output"
        "$mainMod ALT, S, exec, ${pkgs.grimblast}/bin/grimblast copy screen"
        "$mainMod SHIFT, S, exec, ${pkgs.grimblast}/bin/grimblast copy area"

        #volume control
        "$mainMod, bracketleft, exec, ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -5%"
        "$mainMod, bracketright, exec, ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +5%"
        "$mainMod, backslash, exec, ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle"

        #music control
        "$mainMod SHIFT, bracketleft, exec, ${pkgs.mpc-cli}/bin/mpc prev"
        "$mainMod SHIFT, bracketright, exec, ${pkgs.mpc-cli}/bin/mpc next"
        "$mainMod SHIFT, backslash, exec, ${pkgs.mpc-cli}/bin/mpc toggle"

        #toggle window types
        "$mainMod SHIFT, space, togglefloating"
        "$mainMod, F, fullscreen"

        #move between windows in a workspace
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        # change workspace with vim bindings
        "$mainMod SHIFT, L, workspace, e+1"
        "$mainMod SHIFT, H, workspace, e-1"

        # move windows in a workspace
        "$mainMod CTRL, H, movewindow, l"
        "$mainMod CTRL, L, movewindow, r"
        "$mainMod CTRL, K, movewindow, u"
        "$mainMod CTRL, J, movewindow, d"

        #change size of window
        "$mainMod SHIFT CTRL, L, resizeactive, 30 0"
        "$mainMod SHIFT CTRL, H, resizeactive, -30 0"
        "$mainMod SHIFT CTRL, K, resizeactive, 0 -30"
        "$mainMod SHIFT CTRL, J, resizeactive, 0 30"

        # special workspace bindings
        "$mainMod, A, togglespecialworkspace, magic"
        "$mainMod SHIFT, A, movetoworkspacesilent, special:magic"

        "$mainMod ALT, l, split-changemonitor, next"
        "$mainMod ALT, h, split-changemonitor, prev"

      ]
      ++ (
        builtins.concatLists (builtins.genList
          (
            x:
            let
              ws =
                let
                  c = (x + 1) / 10;
                in
                builtins.toString (x + 1 - (c * 10));
            in
            [
              "$mainMod, ${ws}, split-workspace, ${toString (x + 1)}"
              "$mainMod SHIFT, ${ws}, split-movetoworkspacesilent, ${toString (x + 1)}"
            ]
          )
          10)
      );

    };
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      source = "./theme.conf";

      "$accentColor" = "$green";
      "$accentAlpha" = "$greenAlpha";
      "$mainMonitor" = "HDMI-A-1";

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
          font_family = "JetBrains Mono";
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
        {
          monitor = "$mainMonitor";
          text = ''cmd[update:30000] echo "$(date +"%R")"'';
          color = "$text";
          font_size = 90;
          font_family = "JetBrains Mono";
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


  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock"; # avoid starting multiple hyprlock instances.
        before_sleep_cmd = "loginctl lock-session"; # lock before suspend.
        after_sleep_cmd = "hyprctl dispatch dpms on"; # to avoid having to press a key twice to turn on the display.
      };

      listner = [
        {
          timeout = 300;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 420;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 900;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
