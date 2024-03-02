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

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };

    catppuccin-starship = {
      url = "github:catppuccin/starship";
      flake = false;
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };
  };

  outputs = { self, nixpkgs, ... } @ inputs :
    let
      # selfPkgs = import ./pkgs;
      username = "midy";
    in
    {
      # overlays.default = selfPkgs.overlay;
      nixosConfigurations = import ./modules/core/default.nix {
        inherit self nixpkgs inputs username;
      };
    };
}
