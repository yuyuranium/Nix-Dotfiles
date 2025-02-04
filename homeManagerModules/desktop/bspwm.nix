{ lib, config, ... }:

{
  config = lib.mkIf config.desktop.enable {
    xsession.windowManager.bspwm.enable = true;
    xsession.windowManager.bspwm.settings = {
      border_width = 2;
      window_gap = 12;
      split_ratio = 0.5;
      borderless_monocle = true;
      gapless_monocle = true;
      pointer_modifier = "mod4";
      pointer_action1 = "move";
      pointer_action2 = "resize_corner";
      pointer_follows_monitor = false;
      focus_follows_pointer = true;
    };
  };
}
