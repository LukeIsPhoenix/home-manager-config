{ pkgs, ... }:

{
  home.packages = with pkgs; [
    spotify
    gemini-cli
    gimp
    gnome-calculator
    godotPackages_4_6.godot
    spotify
    kitty
    git
    google-chrome
    mattermost-desktop
    brave
    remmina
    freerdp
  ];
}
