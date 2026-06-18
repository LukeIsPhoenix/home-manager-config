let
  nixpkgs = <nixpkgs>;
  pkgs = import nixpkgs {};

  home-manager-src = pkgs.fetchFromGitHub {
    owner = "nix-community";
    repo = "home-manager";
    # 26.05 release
    rev = "c8f0b8ed441c95bfeaf33555e7631044bb09f384";
    hash = "sha256-dk8lIk0UnO8GD3e7e3HM1vSYXpbEDmhy67w7KztfdCg=";
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
    export NIXPKGS_ALLOW_UNFREE=1
    export NIX_PATH="nixpkgs=${nixpkgs}:home-manager=${home-manager}"
    export HOME_MANAGER_CONFIG="./home.nix"
  '';
}
