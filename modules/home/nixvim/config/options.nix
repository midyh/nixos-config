{
  programs.nixvim = {
    options = {
      number = true;

      autoindent = true;
      clipboard = "unnamedplus";
      expandtab = true;
      shiftwidth = 2;
      smartindent = true;
      tabstop = 2;

      swapfile = false;
      undofile = true;
    };
  };
}
