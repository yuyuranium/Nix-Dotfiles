{ lib, pkgs, ... }:

{
  config = {
    programs.zsh = {
      enable = true;
      initContent = lib.mkBefore ''
        typeset -A __Prompt
      '';

      plugins = [
        {
          name = "macOS-singularisart-prompt";
          file = "macOS-singularisart-prompt.zsh-theme";
          src = pkgs.fetchFromGitHub {
            owner = "yuyuranium";
            repo = "macOS-singularisart-prompt";
            rev = "master";
            hash = "sha256-l2bljxGQMMGxBc3q2pfPmAExobCNnDH+EuU4UKOW+vQ=";
          };
        }
        {
          name = "zsh-autopair";
          file = "autopair.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "hlissner";
            repo = "zsh-autopair";
            rev = "master";
            hash = "sha256-3zvOgIi+q7+sTXrT+r/4v98qjeiEL4Wh64rxBYnwJvQ=";
          };
        }
        {
          name = "zsh-completions";
          file = "completions.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "zap-zsh";
            repo = "completions";
            rev = "master";
            hash = "sha256-tvEpQb/p7d/puzwK6CI/HKcB0412BopNAX+fKNPX9JE=";
          };
        }
      ];

      historySubstringSearch = {
        enable = true;
        searchUpKey = [ "$terminfo[kcuu1]" "^[[A" ];
        searchDownKey = [ "$terminfo[kcud1]" "^[[B" ];
      };

      sessionVariables = {
        HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE = 1;
        TERM = "xterm";
        EDITOR = "nvim";
      };

      shellAliases =
        let
          lib = pkgs.lib;
          isLinux = lib.strings.hasSuffix "linux" pkgs.stdenv.hostPlatform.system;
          isDarwin = lib.strings.hasSuffix "darwin" pkgs.stdenv.hostPlatform.system;
        in
      {
        grep = "grep --color=auto";
        cp = "cp -i";
        mv = "mv -i";
        ls = if isDarwin then "ls -G" else if isLinux then "ls --color=auto" else "ls";
      };
    };
  };
}
