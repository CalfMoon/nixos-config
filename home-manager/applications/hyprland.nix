{ pkgs, inputs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = [ inputs.split-monitor-workspaces.packages.${pkgs.stdenv.hostPlatform.system}.split-monitor-workspaces ];
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, Q, killactive"
        # most used applications
        "$mainMod, Return, exec, $TERMINAL"
        "$mainMod SHIFT, Return, exec, $TERMINAL -e $EDITOR"
        "$mainMod CTRL, Return, exec, $BROWSER"

        # terminal based applications
        "$mainMod, I, exec, $TERMINAL -e lf"
        "$mainMod, O, exec, $TERMINAL -e ncmpcpp"
        "$mainMod, P, exec, $TERMINAL -e btop"
        "$mainMod, C, exec, $TERMINAL -a"

        #rofi menus
        "$mainMod, D, exec, exec launcher"
        "$mainMod, R, exec, exec runner"
        "$mainMod, M, exec, exec powermenu"

        #screenshot
        "$mainMod, S, exec, grimblast copy output"
        "$mainMod ALT, S, exec, grimblast copy screen"
        "$mainMod SHIFT, S, exec, grimblast copy area"

        #music control
        "$mainMod, F5, exec, mpc prev"
        "$mainMod, F6, exec, mpc toggle"
        "$mainMod, F7, exec, mpc next"

        #volume control
        "$mainMod, F1, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
        "$mainMod, F2, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
        "$mainMod, F3, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"

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
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
    extraConfig = ''source = ~/.config/hypr/hyprland1.conf'';
  };
}
