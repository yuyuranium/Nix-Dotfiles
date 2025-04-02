{ lib, config, ... }:

{
  config = lib.mkIf config.apps.enable {
    programs.kitty.enable = true;
    programs.kitty.font.name = "SF Mono";
    programs.kitty.font.size = 12;
    programs.kitty.themeFile = "kanagawa_dragon";
    programs.kitty.shellIntegration.mode = "no-cursor";
    programs.kitty.settings = {
      cursor_blink_interval = 0;
      cursor_shape = "block";
      window_border_width = 1;
      window_margin_width = 0;
      window_padding_width = 1;
      linux_display_server = "x11";
      adjust_line_height = "110%";
      adjust_column_width = "105%";
    };
  };
}
