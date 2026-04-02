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
      conform-nvim
      # limelight-vim
      oil-nvim
      gitsigns-nvim
      telescope-nvim
      telescope-fzf-native-nvim
      vim-nix
      vim-lua
      nvim-treesitter.withAllGrammars
      nvim-lspconfig
      nvim-cmp
      luasnip
      cmp_luasnip
      cmp-nvim-lsp
      nvim-autopairs
      lazygit-nvim
      toggleterm-nvim
      catppuccin-nvim
      lualine-nvim
      vim-tmux-navigator
      harpoon2
      flash-nvim
      render-markdown-nvim
      bullets-vim
      vim-table-mode
      glow-nvim
      img-clip-nvim
      outline-nvim
      mkdnflow-nvim
      markdown-preview-nvim
    ];
  };

  home.packages = with pkgs; [
    marksman
    glow
  ];

  home.file.".config/nvim/init.lua" = {
    enable = true;
    source = link ./nvim.lua;
  };
}
