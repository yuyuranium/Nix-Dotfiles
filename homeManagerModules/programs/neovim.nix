{ pkgs, ... }:

{
  config = {
    home.packages = with pkgs; [
      neovim

      # LSP / linters / formatters
      clang-tools
      verilator
      lua-language-server
      nil
      nixpkgs-fmt
      selene
      stylua
      bluespec
      tinymist

      # neovim runtime dependencies
      gcc
      cargo
      unzip
      xsel
      ripgrep
    ];
  };
}
