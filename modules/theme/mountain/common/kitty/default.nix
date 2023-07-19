{ ... }:

{
  programs.kitty = {
    font.name = "FiraCode Nerd Font";
    font.size = 14;
    settings = {
      url_prefexis = "https http";
      strip_trailing_spaces = "smart";
      linux_display_server = "wayland";
      enable_audio_bell = "no";
      cursor_shape = "beam";
      cursor_blink_interval = "-1";
      cursor_stop_blinking_after = "15";
      window_padding_width = "10";
      adjust_line_height = "1";
      adjust_column_width = "1";

      cursor = "#f0f0f0";
      cursor_text_color = "#ffffff";

      foreground = "#f0f0f0";
      background = "#0f0f0f";
      selection_foreground = "#262626";
      selection_background = "#f0f0f0";
      url_color = "#9ec3c4";

      color8 = "#262626";
      color0 = "#4c4c4c";

      color1 = "#ac8a8c";
      color9 = "#c49ea0";

      color2 = "#8aac8b";
      color10 = "#9ec49f";

      color3 = "#aca98a";
      color11 = "#c4c19e";

      color4 = "#8f8aac";
      color12 = "#a39ec4";

      color5 = "#ac8aac";
      color13 = "#c49ec4";

      color6 = "#8aacab";
      color14 = "#9ec3c4";

      color15 = "#e7e7e7";
      color7 = "#f0f0f0";
    };
  };
}

