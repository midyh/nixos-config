{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    userName = "midyh";
    userEmail = "midyan.hamdoun@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "${
        pkgs.git.override { withLibsecret = true; }
      }/bin/git-credential-libsecret";
    };
  };

  home.packages = [ pkgs.gh ];
}

