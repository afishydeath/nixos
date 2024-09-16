{
  description = "Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      # url = "github:nix-community/nixvim";
      # inputs.nixpkgs.follows = "nixpkgs-unstable";
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix/release-24.05";
  };

  outputs = { ... }@inputs: let
    myLib = import ./myLib/default.nix {inherit inputs;};
  in
    with myLib; {
      nixosConfigurations = {
        thickpad = mkSystem ./hosts/thickpad/configuration.nix;
        lenowo = mkSystem ./hosts/lenowo/configuration.nix;
      };
      homeConfigurations = {
        "syn@thickpad" = mkHome "x86_64-linux" ./users/syn/home.nix;
        "syn@lenowo" = mkHome "x86_64-linux" ./users/syn/home.nix;
      };
      nixosModules.default = ./nixosModules;
      homeManagerModules.default = ./homeManagerModules;
    };
}
