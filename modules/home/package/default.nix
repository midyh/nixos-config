{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    eza
    entr
    file
    fzf
    ripgrep
    lazygit
    cinnamon.nemo-with-extensions
    yazi

    gcc
    gnumake

    gparted
    ffmpeg
    imv
    libnotify
    man-pages
    ncdu
    pamixer
    pavucontrol
    playerctl
    qalculate-gtk
    unzip
    wget
    xdg-utils
    inputs.alejandra.defaultPackage.${system}
  ];
}
