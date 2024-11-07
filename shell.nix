let
  nixpkgs = <nixpkgs>;
  pkgs = import nixpkgs {};

  home-manager-src = pkgs.fetchFromGitHub {
    owner = "nix-community";
    repo = "home-manager";
    # 23.11 release
    rev = "2f23fa308a7c067e52dfcc30a0758f47043ec176";
    hash = "sha256-Vl+WVTJwutXkimwGprnEtXc/s/s8sMuXzqXaspIGlwM=";
  };


  # We need to do this weird thing since otherwise the source link
  # somehow doesn't get picked up.
  # See https://github.com/ryantm/home-manager-template/issues/9
  # this is a derivation to depend on the source 
  src-ref-pkg = pkgs.stdenv.mkDerivation {
    name = "source-ref-pkg";
    dontUnpack = true;
    buildPhase = ''
      mkdir $out
      ln -s "${home-manager-src}" $out/src
    '';
  };

  # this is where the actual home-manager derivation is built and linked 
  home-manager = pkgs.buildEnv {
    name = "home-manager";
    paths = [
      (import home-manager-src {inherit pkgs;}).home-manager
      src-ref-pkg
    ];
  };

in pkgs.mkShell rec {
  name = "home-manager-shell";

  buildInputs = with pkgs; [
    home-manager 
  ];
	
  shellHook = ''
    export NIX_PATH="nixpkgs=${nixpkgs}:home-manager=${home-manager}"
    export HOME_MANAGER_CONFIG="./home.nix"
  '';
}
