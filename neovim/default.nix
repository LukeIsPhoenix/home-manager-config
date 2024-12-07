# nvim
{ config, pkgs, ...}:
let
  link = config.lib.file.mkOutOfStoreSymlink;
  nixos-unstable = import (pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = "4aa36568d413aca0ea84a1684d2d46f55dbabad7";
    sha256 = "sha256-Zwl8YgTVJTEum+L+0zVAWvXAGbWAuXHax3KzuejaDyo=";
  }) {};
in
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      # conform-nvim
      hardtime-nvim
      # limelight-vim
      # oil-nvim
      # gitsigns-nvim
      telescope-nvim
      telescope-fzf-native-nvim
      vim-nix
      # vim-lsp
      # lazygit-nvim
      # leap-nvim
      # toggleterm-nvim
      # catppuccin-nvim
      lualine-nvim
      vim-tmux-navigator
    ];
  };

  # home.packages = [
  #   nixos-unstable.neovim
  # ];

  home.file.".config/nvim/init.lua" = {
    enable = true;
    source = link ./nvim.lua;
  };
}
