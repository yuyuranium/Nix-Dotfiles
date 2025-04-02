{ pkgs, lib, config, ... }:

{
  options.apps = {
    enable = lib.mkEnableOption {
      default = true;
    };
  };

  imports = [
    ./kitty.nix
  ];

  config = lib.mkIf config.apps.enable {
    home.packages = with pkgs; [
      xfce.thunar
      microsoft-edge
      mattermost-desktop
    ];
  };
}

