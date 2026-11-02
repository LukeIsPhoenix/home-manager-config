{ pkgs, pkgsUnstable, ... }:

{
  home.packages = with pkgs; [
    (pkgs.symlinkJoin {
      name = "godot";
      paths = [ pkgsUnstable.godot ];
      nativeBuildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        for bin in $out/bin/*; do
          wrapProgram "$bin" --set XMODIFIERS "@im=none"
        done
        for desktop in $out/share/applications/*.desktop; do
          rm "$desktop"
          substitute "${pkgsUnstable.godot}/share/applications/$(basename "$desktop")" "$desktop" \
            --replace-fail "${pkgsUnstable.godot}/bin/" "$out/bin/"
        done
      '';
    })
    aseprite
    blender
    blockbench
    pkgsUnstable.steam
    pkgsUnstable.steam-run
  ];
}
