pkgself: pkgsuper:

{
  haskellPackages = pkgsuper.haskellPackages.override {
    overrides = self: super: {
      Agda = self.callPackage ./Agda.nix { inherit (pkgself) emacs; };
    };
  };
}
