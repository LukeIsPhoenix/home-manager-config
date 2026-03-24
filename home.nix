{ config, pkgs, lib, ... }:
let
  hosts = import ./systems/hosts.nix;
  isGui = lib.elem config.nixpkgs.hostName hosts.gui;
  isTerminal = lib.elem config.nixpkgs.hostName hosts.terminal;
in
lib.mkMerge [
  # Common configuration for all hosts
  {
    home = {
      username = builtins.getEnv "USER";
      homeDirectory = "/home/${builtins.getEnv "USER"}";
      stateVersion = "25.11";
    };
    programs.home-manager.enable = true;
  }

  # Apply terminal configuration for both terminal and GUI machines
  (lib.mkIf (isTerminal || isGui) (import ./systems/terminal.nix))

  # Apply GUI configuration only for GUI machines
  (lib.mkIf isGui (import ./systems/gui.nix { inherit pkgs; }))
]
