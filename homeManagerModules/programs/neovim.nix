{ pkgs, ... }:

{
  config = {
    programs.neovim = {
      enable = true;
    };

    # Dependencies of neovim
    home.packages = with pkgs; [
      gcc
      cargo
      unzip
    ];
  };
}
