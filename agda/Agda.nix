{ mkDerivation, aeson, alex, array, async, base, binary, blaze-html
, boxes, bytestring, Cabal, containers, data-hash, deepseq
, directory, EdisonCore, edit-distance, emacs, equivalence
, exceptions, filepath, geniplate-mirror, gitrev, happy, hashable
, hashtables, haskeline, ieee754, mtl, murmur-hash, pretty, process
, regex-tdfa, split, stdenv, stm, strict, template-haskell, text
, time, transformers, unordered-containers, uri-encode, zlib
}:
mkDerivation {
  pname = "Agda";
  version = "2.6.0";
  sha256 = "bf71bc634a9fe40d717aae76b5b160dfd13a06365615e7822043e5d476c06fb8";
  isLibrary = true;
  isExecutable = true;
  enableSeparateDataOutput = true;
  setupHaskellDepends = [ base Cabal directory filepath process ];
  libraryHaskellDepends = [
    aeson array async base binary blaze-html boxes bytestring
    containers data-hash deepseq directory EdisonCore edit-distance
    equivalence exceptions filepath geniplate-mirror gitrev hashable
    hashtables haskeline ieee754 mtl murmur-hash pretty process
    regex-tdfa split stm strict template-haskell text time transformers
    unordered-containers uri-encode zlib
  ];
  libraryToolDepends = [ alex happy ];
  executableHaskellDepends = [ base directory filepath process ];
  executableToolDepends = [ emacs ];
  postInstall = ''
    files=("$data/share/ghc-"*"/"*"-ghc-"*"/Agda-"*"/lib/prim/Agda/"{Primitive.agda,Builtin"/"*.agda})
    for f in "''${files[@]}" ; do
      $out/bin/agda $f
    done
    for f in "''${files[@]}" ; do
      $out/bin/agda -c --no-main $f
    done
    $out/bin/agda-mode compile
  '';
  homepage = "http://wiki.portal.chalmers.se/agda/";
  description = "A dependently typed functional programming language and proof assistant";
  license = "unknown";
  hydraPlatforms = stdenv.lib.platforms.none;
}
