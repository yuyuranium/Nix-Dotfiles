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
      tmux
      bc
      expect
      file
      dnsutils
      claude-code
    ];

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
