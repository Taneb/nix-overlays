## Taneb's nix overlays

These are [overlays ](https://nixos.wiki/wiki/Overlays) I like to have on various computers.

This repository is intended to be checked out in `.config/nixpkgs/overlays`

### `userpackages.nix`

This file is an overlay a la [LnL7](https://gist.github.com/LnL7/570349866bb69467d0caf5cb175faa74). It defines at the top level of nixpkgs a `userPackages` attribute set, designed to be installed in one go with `nix-env`. This contains a `nix-rebuild` script which will clear the `nix-env` installed set and re-install `userPackages`. This contains a number of packages I like to have installed, including a neovim bundled with configuration.

### `agda`

This directory contains an overlay which switchs the version of Agda to one which is supported on the current release of GHC. I use this as `nix-shell -p haskellPackages.Agda` to get a shell with Agda in the environment.
