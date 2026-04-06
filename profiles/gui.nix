{ pkgs, pkgsUnstable, ... }:

{
  home.packages = with pkgs; [
    discord
    (symlinkJoin {
      name = "spotify";
      paths = [ spotify ];
      nativeBuildInputs = [ makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/spotify \
          --add-flags "--ozone-platform=x11"
      '';
    })
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
