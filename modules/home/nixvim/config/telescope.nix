{
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>ff" = {
        action = "find_files";
      };
      "<leader>fg" = {
        action = "live_grep";
      };
    };
  };
}
