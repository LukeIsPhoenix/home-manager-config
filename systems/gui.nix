{ config, pkgs, lib, pkgsUnstable, ... }:

let
  terminal = import ./terminal.nix { inherit config pkgs lib pkgsUnstable; };
in
{
  imports = [
    (import ./terminal.nix { inherit config pkgs lib pkgsUnstable; })
  ];

  home.packages = with pkgs; terminal.home.packages ++ [
    discord
    spotify
    gimp
    gnome-calculator
    godotPackages_4_6.godot
    google-chrome
    mattermost-desktop
    brave
    remmina
    freerdp
    aseprite
    blender
    blockbench
    desktop-file-utils
  ];

  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Macchiato";
  };

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "kitty.desktop" ];
    };
  };
}
