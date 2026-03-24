{ config, pkgs, lib, ... }:
let
  currentHostName = builtins.getEnv "NIX_HOSTNAME";
  hosts = import ./systems/hosts.nix;
  systemType = if lib.elem currentHostName hosts.gui then "gui" else "terminal";
in
{
  imports = [
    ./systems/${systemType}.nix
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
