{ pkgs, ... }:

{
  imports = [ ../../environment/sway-variables.nix ];
  programs = {
    bash = {
      initExtra = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
          exec sway
        fi
      '';
    };
    fish = {
      loginShellInit = ''
        set TTY1 (tty)
        [ "$TTY1" = "/dev/tty1" ] && exec sway
      '';
    };
  };

  systemd.user = {
    targets.sway-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  };

  home = {
    packages = with pkgs; [
      swaybg
      swayidle
      swaylock-effects
      pamixer
    ];
  };

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = rec {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "${pkgs.wofi}/bin/wofi --show drun";

      input = {
        "type:touchpad" = {
          tap = "enabled";
          dwt = "disabled";
          scroll_method = "two_finger";
          middle_emulation = "disabled";
          natural_scroll = "enabled";
        };
        "type:keyboard" = {
          xkb_layout = "us";
        };
      };

      bars = [ ];

      gaps = {
        inner = 5;
        outer = 0;
      };

      keybindings = {
        "${modifier}+slash" = "workspace back_and_forth";
        "${modifier}+o" = "exec killall -SIGUSR1 .waybar-wrapped";

        "Alt+Left" = "workspace prev";
        "Alt+Right" = "workspace next";

        "${modifier}+shift+g" = "exec swaymsg gaps outer all set 0 && swaymsg gaps inner all set 5";
        "${modifier}+g" = "exec swaymsg gaps outer all set 0 && swaymsg gaps inner all set 0";

        "XF86AudioLowerVolume" = "exec ${pkgs.pamixer}/bin/pamixer -d 5"; #Volume control
        "XF86AudioRaiseVolume" = "exec ${pkgs.pamixer}/bin/pamixer -i 5";
        "XF86AudioMute" = "exec ${pkgs.pamixer}/bin/pamixer -t"; #Media control

        "XF86MonBrightnessUp" = "exec ${pkgs.light}/bin/light -A 5"; # Brightness control
        "XF86MonBrightnessDown" = "exec ${pkgs.light}/bin/light -U 5";

        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl prev";

        "${modifier}+t" = "exec ${terminal}";
        "${modifier}+l" = "exec --no-startup-id myswaylock";
        "${modifier}+q" = "kill";
        "${modifier}+Space" = "exec ${menu}";
        "${modifier}+Shift+c" = "reload";
        "${modifier}+Escape" = "exec swaymsg exit";

        "${modifier}+Left" = "focus left";
        "${modifier}+Right" = "focus right";
        "${modifier}+Up" = "focus up";
        "${modifier}+Down" = "focus down";

        "${modifier}+Shift+Left" = "move left";
        "${modifier}+Shift+Right" = "move right";
        "${modifier}+Shift+Up" = "move up";
        "${modifier}+Shift+Down" = "move down";

        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";

        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";

        "${modifier}+f" = "fullscreen";
      };
    };
    extraConfig = ''
      set $opacity 0.9
      for_window [app_id="Alacritty"] opacity $opacity

      output * adaptive_sync on
      default_border pixel 3

      smart_borders on

      exec_always --no-startup-id launch_waybar &
      exec_always --no-startup-id mako &
      exec_always --no-startup-id nm-applet --indicator &

      client.focused          #ffc0cb #ffc0cb #ffffff
      client.unfocused        #2e3440 #1f222d #888888
      client.focused_inactive #2e3440 #1f222d #888888 
      client.placeholder      #2e3440 #1f222d #888888
      client.urgent           #D08770 #D08770 #ffffff
      client.background       #242424

      exec_always --no-startup-id default_wall &

      exec swayidle -w \
          timeout 600 'systemctl suspend' \
          before-sleep 'myswaylock'

    '';
  };
}

