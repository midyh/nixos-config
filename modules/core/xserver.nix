{ pkgs, username, ... }:
{
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    displayManager.autoLogin = {
      enable = true;
      user = "${username}";
    };
    libinput = {
      enable = true;
    };
  };

  # systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
 
