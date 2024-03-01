{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    userName = "midyh";
    userEmail = "midyan.hamdoun@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "store";
    };
  };

  home.packages = [ pkgs.gh ];
}

