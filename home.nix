{ config, pkgs, lib, ... }:
let
  hostname = config.nixpkgs.hostName;
  hosts = import ./systems/hosts.nix;
  systemType = if lib.elem hostname hosts.gui then "gui" else "terminal";
in
{
  imports = [
    ./systems/${systemType}.nix
  ];

  home = {
    username = builtins.getEnv "USER";
    homeDirectory = "/home/${builtins.getEnv "USER"}";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;
}
