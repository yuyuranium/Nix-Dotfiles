{ pkgs, lib, config, ... }:

{
  options.gui = {
    enable = lib.mkEnableOption {
      default = false;
    };
  };

  config = lib.mkIf config.gui.enable {
    # Use X11 and en_US layout
    services.xserver.enable = true;
    services.xserver.xkb.layout = "us";

    services.xserver.autoRepeatDelay = 230;
    services.xserver.autoRepeatInterval = 33;

    # Display manager and default tiling window manager
    services.displayManager.ly.enable = true;
    services.xserver.windowManager.bspwm.enable = true;

    services.picom = {
      enable = true;
      package = pkgs.picom-pijulius;
    };

    # Use kitty for terminal emulator
    environment.systemPackages = with pkgs; [
      kitty
    ];
  };
}
