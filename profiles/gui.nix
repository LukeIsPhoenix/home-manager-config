{ pkgs, pkgsUnstable, ... }:

{
  home.packages = with pkgs; [
    discord
    spotify
    gimp
    gnome-calculator
    google-chrome
    mattermost-desktop
    brave
    remmina
    freerdp
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
