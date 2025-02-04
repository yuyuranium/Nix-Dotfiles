{ pkgs, ... }:

{
  imports = [
    ./git.nix
    ./neovim.nix
    ./zsh.nix
  ];

  config = {
    # Programs without custom config
    home.packages = with pkgs; [
      htop
      fastfetch
    ];
  };
}
