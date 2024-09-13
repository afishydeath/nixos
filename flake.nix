{
  description = "Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:

  let
    systemSettings = {
      system = "x86_64-linux";
      hostname = "thickpad";
      timezone = "Australia/Sydney";
    };
    userSettings = {
      username = "syn";
      email = "afishydeath@gmail.com";
      theme = "everforest";
    };
    
    pkgs = import nixpkgs { system = systemSettings.system; };
  in
  {
    nixosConfigurations = {
      thickpad = nixpkgs.lib.nixosSystem {
        specialArgs = { system = systemSettings.system; inherit systemSettings; };
        modules = [
          # ./hosts/thickpad/configuration.nix
          # ./modules/system/default.nix
          ./hosts/default.nix
        ];
      };
    };
    homeConfigurations = {
      syn = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs; inherit userSettings;};
        modules = [./users/syn/home.nix];
      };
    };
  };
}
