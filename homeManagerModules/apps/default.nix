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
  };
}

