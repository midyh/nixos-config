{
  programs.nixvim.keymaps = [
    {
      action = "<cmd>NvimTreeToggle<CR>";
      key = "<C-n>";
    }
    {
      action = "<cmd>NvimTreeFocus<CR>";
      key = "<leader>e";
    }
  ];
}
