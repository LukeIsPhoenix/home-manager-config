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
  home.packages = [
    nixos-unstable.neovim
  ];

  home.file.".config/nvim" = { 
    enable = true;
    source = link ./nvim;
  };
}
