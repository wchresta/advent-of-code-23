{
  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem(system:
      let
        pkgs = import nixpkgs { inherit system; };

        ghc = pkgs.haskellPackages.ghcWithHoogle (ps: with ps; [ ]);
      in {
        devShells.default = pkgs.mkShell {
          packages = [ ghc pkgs.haskell-language-server ];
        };
      });
}
