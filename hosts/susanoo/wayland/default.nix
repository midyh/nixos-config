{ pkgs, user, ... }:

{
  imports =
    (import ../../../modules/hardware) ++
    [
      ../hardware-configuration.nix
      ../../../modules/fonts
      ../../../modules/desktop/sway
    ];

  programs.fish.enable = true;
  users.users.${user} = {
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "camera" "networkmanager" ];
  };

  boot = {
    bootspec.enable = true;
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
      };

      timeout = 3;
    };
  };
  
  networking.hostName = "susanoo";

  environment.systemPackages = with pkgs; [
    libnotify
    wl-clipboard
    wlr-randr
    wayland
    wayland-scanner
    wayland-utils
    xwayland
    networkmanagerapplet
    alsa-lib
    alsa-utils
    pkgs.sway-contrib.grimshot
    flameshot
    grim
    polkit_gnome
    rust-bin.stable.latest.default
  ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
    };
  };
  security.polkit.enable = true;
}

