{ pkgs, config, lib, homeManagerModules, ... }:

{
  options.yuyu = {
    enable = lib.mkEnableOption {
      default = true;
    };
    home-config = lib.mkOption {
      type = lib.types.path;
    };
  };

  config = lib.mkIf config.yuyu.enable {
    # yuyu uses zsh
    programs.zsh.enable = true;

    # yuyu's NixOS setting
    users.users.yuyu = {
      initialPassword = "0000";
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # yuyu is a sudoer
      shell = pkgs.zsh;
    };

    # yuyu uses home-manager
    home-manager = {
      users.yuyu = {
        imports = [
          config.yuyu.home-config
          homeManagerModules
        ];
      };
    };
  };
}
