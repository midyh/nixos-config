{ ... }:

{
  services.mako = {
    font = "FiraCode Nerd Font";
    width = 350;
    layer = "top";
    background-color = "#0f0f0f";
    text-color = "#f0f0f0";
    margin = "0,30,0";
    padding = 10;
    border-size = 2;
    border-color = "#262626";
    progress-color = "over #262626ff";
    border-radius = 5;
    default-timeout = 10000;
    group-by = "summery";

    extraConfig = ''
      [grouped]
      format=<b>%s</b>\n%b
    '';
  };
}

