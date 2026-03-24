export NIX_HOSTNAME=$(hostname)
nix-shell --run "home-manager switch -b backup"
