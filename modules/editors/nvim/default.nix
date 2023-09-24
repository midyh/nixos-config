{ config, lib, inputs, pkgs, ... }:

{
  nixpkgs.config = {
    programs.npm.npmrc = ''
      prefix = ''${HOME}/.npm-global
    '';
  };

  programs.neovim =
  let
    luaFile = file: builtins.readFile file;
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = ''
      -- Write lua code here

      ${builtins.readFile ./options.lua}
    '';

    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-lspconfig;
        type = "lua";
	      config = luaFile ./plugin/lsp.lua;
      }

      {
        plugin = telescope-nvim;
        type = "lua";
	      config = luaFile ./plugin/telescope.lua;
      }

      {
        plugin = catppuccin-nvim;
        type = "lua";
        config = "vim.cmd(\"colorscheme catppuccin\")";
      }

      {
        plugin = comment-nvim;
        type = "lua";
        config = "require(\"Comment\").setup()";
      }

      telescope-fzf-native-nvim

      {
      	plugin = nvim-tree-lua;
        type = "lua";
	      config = luaFile ./plugin/treelua.lua;
      }

      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-c
          p.tree-sitter-cpp
          p.tree-sitter-java
	        p.tree-sitter-nix
	        p.tree-sitter-lua
	      ]));
        type = "lua";
        config = luaFile ./plugin/treesitter.lua;
      }
    ];
  };
}

