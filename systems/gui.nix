{ pkgs, ... }:

let
  terminal = import ./terminal.nix { inherit pkgs; };
in
{
  imports = [ ./terminal.nix ];

  home.packages = with pkgs; terminal.home.packages ++ [
    discord
    spotify
    gemini-cli
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
