{ ... }:

{
  services.mako = {
    font = "FiraCode Nerd Font";
    width = 350;
    layer = "top";
    backgroundColor = "#0f0f0f";
    textColor = "#f0f0f0";
    margin = "0,30,0";
    padding = "10";
    borderSize = 2;
    borderColor = "#262626";
    progressColor = "over #262626ff";
    borderRadius = 5;
    defaultTimeout = 10000;
    groupBy = "summery";

    extraConfig = ''
      [grouped]
      format=<b>%s</b>\n%b
    '';
  };
}

