# nvim
{ config, pkgs, ...}:
let
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      lazygit-nvim
      lualine-nvim
      nvim-tree-lua
      nvterm
    ];
  };

  home.file.".config/nvim/init.lua" = { 
    enable = true;
    source = link ./init.lua;
  };
}
