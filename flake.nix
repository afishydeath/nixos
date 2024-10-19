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
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, stylix, nixos-wsl, ... }@inputs:

  let
    systemSettings = {
      system = "x86_64-linux";
      timezone = "Australia/Sydney";
    };
    userSettings = {
      username = "syn";
      email = "afishydeath@gmail.com";
      stylixSettings = {
        enable = true;
        image = ./wallpapers/pixel_galaxy.png;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/heetch.yaml";
        fonts = {
          sansSerif = {
            package = pkgs.fira-code-nerdfont;
            name = "Fira Code Nerd Font";
          };
          monospace = {
            package = pkgs.fira-code-nerdfont;
            name = "Fira Code Nerd Font Mono";
          };
        };
      };
    };
    
    pkgs = import nixpkgs { system = systemSettings.system; };
    pkgs-unstable = import nixpkgs-unstable { system = systemSettings.system; };

  in
  {
    nixosConfigurations = {
      thickpad = nixpkgs.lib.nixosSystem {
        specialArgs = {
          system = systemSettings.system;
          inherit systemSettings;
          inherit userSettings;
          hostname = "thickpad"; 
        };
        modules = [
          ./hosts/default.nix
          stylix.nixosModules.stylix
        ];
      };
      lenowo = nixpkgs.lib.nixosSystem {
        specialArgs = {
          system = systemSettings.system;
          inherit systemSettings;
          inherit userSettings;
          hostname = "lenowo";
        };
        modules = [
          ./hosts/default.nix
          stylix.nixosModules.stylix
        ];
      };
      chromie = nixpkgs.lib.nixosSystem {
        specialArgs = {
          system = systemSettings.system;
          inherit systemSettings;
          inherit userSettings;
          hostname = "chromie";
        };
        modules = [
          ./hosts/default.nix
          stylix.nixosModules.stylix
        ];
      };
      wsl = nixpkgs.lib.nixosSystem {
        specialArgs = {
          system = systemSettings.system;
          inherit systemSettings;
          inherit userSettings;
          hostname = "wsl";
        };
        system = systemSettings.system;
        modules = [
          nixos-wsl.nixosModules.default
          ./hosts/default.nix
          stylix.nixosModules.stylix
        ];
      };
    };
    homeConfigurations = {
      ${userSettings.username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          inherit userSettings;
          inherit pkgs-unstable;
        };
        modules = [ stylix.homeManagerModules.stylix ./users/default.nix];
      };
    };
  };
}
