{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      clangd.enable = true;
      nil_ls.enable = true;
    };

    keymaps.lspBuf = {
      "gd" = "definition";
      "gD" = "references";
      "K" = "hover";
    };
  };
}

