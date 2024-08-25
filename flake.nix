{
  description = "Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:

  let
    system = "x86_64-linux";
    
    pkgs = import nixpkgs { inherit system; };
  in
  {
    nixosConfigurations = {
      thickpad = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; };
        modules = [
          ./hosts/thickpad/configuration.nix
          # ./modules/system/default.nix
        ];
      };
    };
    homeConfigurations = {
      syn = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./users/syn/home.nix];
      };
    };
  };
}
