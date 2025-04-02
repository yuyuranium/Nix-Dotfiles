{ pkgs, lib, ... }:

{
  config = {
    programs.neovim = {
      enable = true;
      extraWrapperArgs = [
        "--suffix"
        "LIBRARY_PATH"
        ":"
        "${lib.makeLibraryPath [ pkgs.stdenv.cc.cc pkgs.zlib ]}"
        "--suffix"
        "PKG_CONFIG_PATH"
        ":"
        "${lib.makeSearchPathOutput "dev" "lib/pkgconfig" [ pkgs.stdenv.cc.cc pkgs.zlib ]}"
      ];
    };

    # Dependencies of neovim
    home.packages = with pkgs; [
      gcc
      cargo
      unzip
      xsel
    ];
  };
}
