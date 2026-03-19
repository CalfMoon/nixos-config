{ pkgs, inputs, ... }: {
  wayland.windowManager.hyprland.systemd.variables = [ "--all" ];

  home.packages = with pkgs; [
    waypaper
    swww
  ];

  wayland.windowManager.hyprland = {
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    plugins = [ inputs.split-monitor-workspaces.packages.${pkgs.stdenv.hostPlatform.system}.split-monitor-workspaces ];

    enable = true;
    settings = {
      source = [ "./theme.conf" ];

      "$accentColor" = "$green";
      "$accentAlpha" = "$greenAlpha";

      exec-once = [
        "${pkgs.swww}/bin/swww-daemon --format xrgb"
        "${pkgs.waybar}/bin/waybar"
        # "${pkgs.qbittorrent}/bin/qbittorrent"
      ];

      input = {
        kb_layout = "us";
        kb_options = "ctrl:nocaps";
        follow_mouse = true;
        sensitivity = 0;
        touchpad = {
          natural_scroll = "no";
        };
      };

      plugin = {
        split-monitor-workspaces = {
          enable_persistent_workspaces = false;
        };
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

        dim_inactive = true;
        dim_strength = 0.2;
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

      "$mainMod" = "SUPER";

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bind =
        [
          "$mainMod, Q, killactive"

          # most used applications
          "$mainMod, Return, exec, $TERMINAL"
          "$mainMod SHIFT, Return, exec, $TERMINAL -e $EDITOR"
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
          "ALT, S, exec, ${pkgs.grimblast}/bin/grimblast copy area"
          "$mainMod ALT, S, exec, ${pkgs.grimblast}/bin/grimblast copy screen"

          #volume control
          "$mainMod, bracketleft, exec, ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -5%"
          "$mainMod, bracketright, exec, ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +5%"
          "$mainMod, backslash, exec, ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle"

          #music control
          "$mainMod SHIFT, bracketleft, exec, ${pkgs.mpc}/bin/mpc prev"
          "$mainMod SHIFT, bracketright, exec, ${pkgs.mpc}/bin/mpc next"
          "$mainMod SHIFT, backslash, exec, ${pkgs.mpc}/bin/mpc toggle"

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
        ]
        ++ (
          builtins.concatLists (builtins.genList
            (x:
              let
                ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
              in
              [
                "$mainMod, ${ws}, split-workspace, ${toString (x + 1)}"
                "$mainMod SHIFT, ${ws}, split-movetoworkspacesilent, ${toString (x + 1)}"
              ])
            10)
        );
    };
  };
}
