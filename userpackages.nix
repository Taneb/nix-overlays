self: super:

{
  userPackages = super.userPackages or {} // {
    inherit (self)
      cabal-install
      cabal2nix
      ed
      emacs
      ghc
      gitFull
      graphviz
      jq
      meld
      pandoc
      nix-index
      ripgrep
      rustup
      shellcheck
      tmux
      tree
      watchexec;
    inherit (self.haskellPackages)
      ghcid
      glirc;
    neovim = self.neovim.override {
      vimAlias = true;
      viAlias = true;
      configure = {
        customRC = ''
          set mouse=a
          set number
          set expandtab
          colorscheme industry
        '';
        packages.myNvimPackages = with self.vimPlugins; {
          start = [ elm-vim vim-nix vim-surround ctrlp vim-toml ];
          opt = [];
        };
      };
    };
    nix-rebuild = super.writeScriptBin "nix-rebuild"
      ''
        #!${super.stdenv.shell}
	exec nix-env -f '<nixpkgs>' -r -iA userPackages
      '';
  };
}
