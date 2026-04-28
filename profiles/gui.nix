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
    (symlinkJoin {
      name = "brave";
      paths = [ brave ];
      nativeBuildInputs = [ makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/brave \
          --add-flags "--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations"
      '';
    })
    remmina
    freerdp
    appimage-run
    wireguard-tools
  ];

  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Macchiato";
    settings = {
      clipboard_control = "write-clipboard write-primary read-clipboard read-primary";
    };
  };

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "kitty.desktop" ];
    };
  };
}
