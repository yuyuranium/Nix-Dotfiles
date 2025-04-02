{ pkgs, lib, config, ... }:

let
  dwall = pkgs.stdenv.mkDerivation rec {
    name = "dwall";
    src = pkgs.fetchFromGitHub {
      owner = "adi1090x";
      repo = "dynamic-wallpaper";
      rev = "master";
      hash = "sha256-fvVPn/nHA06nnopf1LddLFxrlYpm7aPTQ00nTbDkcQU=";
    };

    installPhase = ''
      mkdir -p ${placeholder "out"}/bin
      mkdir -p ${placeholder "out"}/share/dwall
      cp ${src}/dwall.sh ${placeholder "out"}/bin/dwall
      cp -r ${src}/images ${placeholder "out"}/share/dwall
      substituteInPlace ${placeholder "out"}/bin/dwall \
        --replace "/usr/share/dynamic-wallpaper" "${placeholder "out"}/share/dwall"
      chmod +x ${placeholder "out"}/bin/dwall
    '';
  };
in
{
  config = lib.mkIf config.desktop.enable {
    home.packages = with pkgs; [ feh cron ] ++ [ dwall ];
  };
}
