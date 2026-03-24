{ pkgs, ... }:

{
  imports = [
    ../tmux
    ../bash
    ../neovim
  ];

  home.packages = with pkgs; [
    fzf
    lazygit
    tmux
    tmuxPlugins.resurrect
    gcc
    ripgrep
    dos2unix
    lua51Packages.lua
    luarocks
    cargo
    unzip
    fd
    hstr
    nodejs
  ];

  programs = {
    gitui.enable = true;

    zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}