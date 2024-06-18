{ config, pkgs, ... }: 
let 
  # allow editing of files outside of the nix store
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
  # import my custom configuations
  imports = [
   ./tmux
   ./bash
   ./neovim
  ];

  home = {
    username = builtins.getEnv "USER";
    homeDirectory = "/home/${builtins.getEnv "USER"}";
    packages = with pkgs; [
        # Add packages here, search at https://search.nixos.org/packages
        lazygit
        tmux
    ];
    
    stateVersion = "23.11";
  };

  # TODO: figure out what this was for 
  programs = {
     gitui.enable = true; # is this for lazygit

     zoxide = { 
        enable = true;
        enableBashIntegration = true;
     };

     home-manager = { # required for home-manager to manage itself?
        enable = true;
     };
  };
}
