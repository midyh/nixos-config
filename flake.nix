{
  description = "My personal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, ... } @ inputs:
    let
      user = "midy";
      selfPkgs = import ./pkgs;
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;

      overlays.default = selfPkgs.overlay;
      nixosConfigurations = (
        import ./hosts {
          system = "x86_64-linux";
          inherit nixpkgs self inputs user;
        }
      );
    };
}

