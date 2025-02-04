{ pkgs, ... }:

{
  config = {
    programs.zsh = {
      enable = true;

      initExtraFirst = ''
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
            hash = "sha256-MyjRRJouwhCmQvU4pHF8usmHxj65/4To1L9pBJebbbw=";
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
        searchUpKey = [ "$terminfo[kcuu1]" ];
        searchDownKey = [ "$terminfo[kcud1]" ];
      };

      sessionVariables = {
        HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE = 1;
        TERM = "xterm";
        EDITOR = "nvim";
      };

      shellAliases = {
        grep = "grep --color=auto";
        cp = "cp -i";
        mv = "mv -i";
      };
    };
  };
}
