{ pkgs, pkgsUnstable, ... }:

{
  imports = [
    ../tmux
    ../bash
    ../neovim
  ];

  home.packages = with pkgs; [
    git
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
    pkgsUnstable.gemini-cli
    btop
  ];

  programs = {
    gitui.enable = true;

    zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
