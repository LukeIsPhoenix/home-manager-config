{ config, pkgs, lib, ... }:
let
  currentHostName = builtins.getEnv "NIX_HOSTNAME";
  hosts = import ./hosts.nix;
  hostConfigs = hosts.${currentHostName} or [ "terminal" ];
  pkgsUnstable = import (builtins.fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") {};
in
{
  imports = map (name: import ./profiles/${name}.nix { inherit pkgs lib config pkgsUnstable; }) hostConfigs;

  nixpkgs.config.allowUnfree = true;

  home = {
    username = builtins.getEnv "USER";
    homeDirectory = "/home/${builtins.getEnv "USER"}";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;

  targets.genericLinux.enable = true;
}
