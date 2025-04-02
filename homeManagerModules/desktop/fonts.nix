{ pkgs, lib, config, ... }:

{

  config =
    let
      sf-mono = pkgs.stdenv.mkDerivation rec {
        name = "SF Mono";

        font = pkgs.fetchFromGitHub {
          owner = "supercomputra";
          repo = "SF-Mono-Font";
          rev = "master";
          sha256 = "sha256-3wG3M4Qep7MYjktzX9u8d0iDWa17FSXYnObSoTG2I/o=";
        };

        phases = [ "installPhase" ];

        installPhase = ''
          mkdir -p $out/share/fonts/opentype
          cp ${font}/*.otf $out/share/fonts/opentype
        '';
      };

      apple-color-emoji = pkgs.stdenv.mkDerivation rec {
        name = "Apple Color Emoji";

        font = pkgs.fetchurl {
          url =
            "https://github.com/samuelngs/apple-emoji-linux/releases/latest/download/AppleColorEmoji.ttf";
          hash = "sha256-SG3JQLybhY/fMX+XqmB/BKhQSBB0N1VRqa+H6laVUPE=";
        };

        phases = [ "installPhase" ];

        installPhase = ''
          mkdir -p $out/share/fonts/truetype
          cp ${font} $out/share/fonts/truetype/AppleColorEmoji.ttf
        '';
      };
    in
    lib.mkIf config.desktop.enable {
      home.packages = with pkgs; [
        iosevka
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
      ] ++ [ sf-mono apple-color-emoji ];

      fonts.fontconfig.enable = true;
      fonts.fontconfig.defaultFonts.emoji = [ "Apple Color Emoji" ];
    };
}
