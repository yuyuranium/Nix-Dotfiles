{ pkgs, ... }:

{
  config = {
    programs.neovim = {
      enable = true;

      extraPackages = with pkgs; [
        clang-tools
        verilator
        lua-language-server
        nil
        nixpkgs-fmt
        selene
        stylua
        bluespec
      ];
    };

    # Dependencies of neovim
    home.packages = with pkgs; [
      gcc
      cargo
      unzip
      xsel
      ripgrep
    ];
  };
}
