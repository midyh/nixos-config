{ system, self, nixpkgs, inputs, user, ... }:

let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;
in
{
  amaterasu = lib.nixosSystem {
    inherit system;

    specialArgs = { inherit inputs user; };

    modules = [
      ./amaterasu/gnome
    ] ++ [
      ./system.nix
    ] ++ [
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
    	  useGlobalPkgs = true;
    	  useUserPackages = true;
    	  extraSpecialArgs = { inherit user; };
    	  users.${user} = {
    	    imports = [
    	      (import ./amaterasu/gnome/home.nix)
          ];
    	  };
      };
      
    	nixpkgs = {
      	  overlays = [
      	    self.overlays.default
          ];
        };
      }
    ];
  };
  susanoo = lib.nixosSystem {
    inherit system;

    specialArgs = { inherit inputs user; };

    modules = [
      ./susanoo/wayland # Sway
    ] ++ [
      ./system.nix
    ] ++ [
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit user; };
          users.${user} = {
            imports = [
              (import ./susanoo/wayland/home.nix)
            ];
          };
        };

        nixpkgs = {
          overlays = [
            self.overlays.default
            inputs.rust-overlay.overlays.default
          ]; # ++ (import ../overlays);
        };
      }
    ];
  };
}

