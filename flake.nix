{
  description = "My system config in a flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";

    alejandra.url = "github:kamadorueda/alejandra/3.0.0";

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin-starship = {
      url = "github:catppuccin/starship";
      flake = false;
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    username = "midy";
  in {
    nixosConfigurations = import ./modules/core/default.nix {
      inherit self nixpkgs inputs username;
    };
  };
}
