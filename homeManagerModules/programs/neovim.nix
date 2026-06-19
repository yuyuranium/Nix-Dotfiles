{ pkgs, ... }:

{
  config = {
    programs.neovim = {
      enable = true;
      withRuby = false;
      withPython3 = false;

      extraPackages = with pkgs; [
        clang-tools
        verilator
        lua-language-server
        nil
        nixpkgs-fmt
        selene
        stylua
        bluespec
        tinymist
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
