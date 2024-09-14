{
  description = "Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix/release-24.05";
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs:

  let
    systemSettings = {
      system = "x86_64-linux";
      hostname = "lenowo";
      timezone = "Australia/Sydney";
    };
    userSettings = {
      username = "syn";
      email = "afishydeath@gmail.com";
      stylixSettings = {
        enable = true;
        image = ./wallpapers/pixel_galaxy.png;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/heetch.yaml";
        # polarity = "dark";
      };
    };
    
    pkgs = import nixpkgs { system = systemSettings.system; };
  in
  {
    nixosConfigurations = {
      ${systemSettings.hostname}= nixpkgs.lib.nixosSystem {
        specialArgs = { system = systemSettings.system; inherit systemSettings; inherit userSettings; };
        modules = [
          # ./hosts/thickpad/configuration.nix
          # ./modules/system/default.nix
          ./hosts/default.nix
          stylix.nixosModules.stylix
        ];
      };
    };
    homeConfigurations = {
      ${userSettings.username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs; inherit userSettings; };
        modules = [ stylix.homeManagerModules.stylix ./users/default.nix];
      };
    };
  };
}
