# Install from scratch
```
env NIX_CONFIG="experimental-features = nix-command flakes" \
  nix shell nixpkgs#git --command sudo nixos-rebuild switch --flake github:TheGreatWaves/dotfiles#default
```
