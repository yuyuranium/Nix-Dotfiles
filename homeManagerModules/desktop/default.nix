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
      microsoft-edge
      mattermost-desktop
      xfce.thunar
      dconf
      gscreenshot
    ];

    xsession.enable = true;

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
