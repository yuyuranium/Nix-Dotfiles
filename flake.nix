{
  description = "Nix dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }@inputs:
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
      };
    };
}
