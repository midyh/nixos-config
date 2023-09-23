{ pkgs, inputs, ... }:

{
  nixpkgs.system = "x86_64-linux";

  nixpkgs.config.allowUnfree = true;

  networking = {
    networkmanager.enable = true;
    # networkmanager.enableStrongSwan = true;
  };

  time.timeZone = "Europe/Athens";

  i18n.defaultLocale = "en_US.UTF-8";

  security.rtkit.enable = true;
  services = {
    openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        # PasswordAuthentication = false;
      };
    };
  };

  environment = {
    binsh = "${pkgs.dash}/bin/dash";
    shells = with pkgs; [ fish ];
    systemPackages = with pkgs; [
      git
      neovim
      wget
      exa
      bat

      # C/C++
      gcc
      clang
      glib

      # Node.js
      nodejs

      # Java
      openjdk8-bootstrap

      libreoffice-qt
      gdb
      p7zip
      unzip
      joshuto
      ffmpeg
      xdg-utils
      killall
      socat
      zip
      rar
      frp
      sops
    ];
  };
  services.dbus.enable = true;

  nix = {
    settings = {
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };

    package = pkgs.nixVersions.unstable;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };

  system = {
    autoUpgrade = {
      enable = false;
      channel = "https://nixos.org/channels/nixos-unstable";
    };

    stateVersion = "23.05";
  };
}

