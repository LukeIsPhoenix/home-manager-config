{ config, pkgs, lib, ... }:
let
  currentHostName = builtins.getEnv "NIX_HOSTNAME";
  hosts = import ./systems/hosts.nix;
  systemType = if lib.elem currentHostName hosts.gui then "gui" else "terminal";
  pkgsUnstable = import (builtins.fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") {};
in
{
  imports = [
    (import ./systems/${systemType}.nix { inherit pkgs lib config pkgsUnstable; })
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = builtins.getEnv "USER";
    homeDirectory = "/home/${builtins.getEnv "USER"}";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;

  targets.genericLinux.enable = true;
}
