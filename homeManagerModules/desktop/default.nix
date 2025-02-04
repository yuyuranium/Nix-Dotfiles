{ pkgs, lib, config, ... }:

{
  options.desktop = {
    enable = lib.mkEnableOption {
      default = true;
    };
  };

  imports = [
    ./bspwm.nix
    ./picom.nix
    ./sxhkd.nix
  ];

  config = lib.mkIf config.desktop.enable {
    home.packages = with pkgs; [
      kitty
    ];
  };
}
