{ pkgs, lib, config, ... }:

{
  options.desktop = {
    enable = lib.mkEnableOption {
      default = true;
    };
  };

  imports = [
    ./bspwm.nix
    ./fonts.nix
    ./picom.nix
    ./rofi.nix
    ./sxhkd.nix
    ./wallpaper.nix
  ];

  config = lib.mkIf config.desktop.enable {
    home.packages = with pkgs; [
      dconf
      gscreenshot
    ];

    xsession.enable = true;
    xsession.initExtra = ''
      xrandr --output DP-1 --mode 1920x1200 --pos 0x0 --rotate left --output HDMI-1 --off --output HDMI-2 --primary --mode 1920x1080 --pos 1200x332 --rotate normal
      xsetroot -cursor_name left_ptr
    '';

    home.pointerCursor.name = "macOS";
    home.pointerCursor.size = 24;
    home.pointerCursor.package = pkgs.apple-cursor;

    gtk.enable = true;

    gtk.theme.name = "Matcha-dark-azul";
    gtk.theme.package = pkgs.matcha-gtk-theme;

    gtk.iconTheme.name = "Papirus-Dark";
    gtk.iconTheme.package = pkgs.papirus-icon-theme;

    gtk.font.name = "Iosevka";
  };
}
