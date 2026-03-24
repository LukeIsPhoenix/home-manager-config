{ pkgs, ... }:

let
  terminal = import ./terminal.nix { inherit pkgs; };
in
{
  imports = [ ./terminal.nix ];

  home.packages = with pkgs; terminal.home.packages ++ [
    spotify
    gemini-cli
    gimp
    gnome-calculator
    godotPackages_4_6.godot
    kitty
    google-chrome
    mattermost-desktop
    brave
    remmina
    freerdp
    git
  ];
}
