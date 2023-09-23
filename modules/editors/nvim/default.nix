{ config, lib, inputs, pkgs, ... }:

{
  nixpkgs.config = {
    programs.npm.npmrc = ''
      prefix = ''${HOME}/.npm-global
    '';
  };

  programs.neovim =
  let
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
	      config = toLuaFile ./plugin/lsp.lua;
      }

      {
        plugin = telescope-nvim;
	      config = toLuaFile ./plugin/telescope.lua;
      }

      telescope-fzf-native-nvim

      {
      	plugin = nvim-tree-lua;
	      config = toLuaFile ./plugin/treelua.lua;
      }

      {
        plugin = (nvim-treesitter.withPlugins (p: [
	        p.tree-sitter-nix
	        p.tree-sitter-lua
	      ]));
        config = toLuaFile ./plugin/treesitter.lua;
      }
    ];
  };
}

