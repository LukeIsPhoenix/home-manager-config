# nvim
{ config, pkgs, ...}:
let
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = [
    pkgs.neovim
  ];

  home.file.".config/nvim" = { 
    enable = true;
    source = link ./nvim;
  };
}
