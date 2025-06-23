{
  description = "Nix dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    attic.url = "github:zhaofengli/attic";
  };

  outputs = { self, nixpkgs, home-manager, attic }@inputs:
    let
      homeManagerModules = ./homeManagerModules;
    in
    {
      nixosConfigurations = {
        asus-qq = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit homeManagerModules; } // inputs;
          modules = [
            ./hosts/asus-qq/configuration.nix
            ./nixosModules
          ];
        };

        uupc = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit homeManagerModules; } // inputs;
          modules = [
            ./hosts/uupc/configuration.nix
            ./nixosModules
          ];
        };
      };
    };
}
