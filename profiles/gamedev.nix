{ pkgs, pkgsUnstable, ... }:

{
  home.packages = with pkgs; [
    pkgsUnstable.godot
    aseprite
    blender
    blockbench
  ];
}
