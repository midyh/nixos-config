{ ... }:

{
  programs.foot.settings = { 
    main = {
      font = "FiraCode Nerd Font:size=11";
      dpi-aware = "yes";
    };

    mouse = {
      hide-when-typing = "yes";
    }; 

    cursor = {
      style = "beam";
      color = "191724 e0def4";
    };

    colors = {
      background="191724";
      foreground="e0def4";
      regular0="26233a";
      regular1="eb6f92";
      regular2="31748f";
      regular3="f6c177";
      regular4="9ccfd8";
      regular5="c4a7e7";
      regular6="ebbcba";
      regular7="e0def4";

      bright0="6e6a86";
      bright1="eb6f92";
      bright2="31748f";
      bright3="f6c177";
      bright4="9ccfd8";
      bright5="c4a7e7";
      bright6="ebbcba";
      bright7="e0def4";
    };

    csd = {
      border-width = "2";
      border-color = "ff404040";
    };
  };
}
