{ home-manager, ... }:

{
  imports = [
    home-manager.nixosModules.default
    ./gui
    ./yuyu
  ];

  config = {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;
  };
}
