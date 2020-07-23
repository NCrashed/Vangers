
{ stdenv, fetchgit, cmake, pkgconfig, libogg, libvorbis, SDL2 }:
stdenv.mkDerivation rec {

  name = "clunk";

  src = fetchgit {
    url = "https://github.com/stalkerg/clunk.git";
    rev = "6d4cbbe1b6f1e202b9945d20073952b254e8d530";
    sha256 = "1kw1fh8nb273zbxi637w35z83y8cwqqyv7bkwzgq48hqnkpaygkk";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ pkgconfig cmake ];
  buildInputs = [
      libogg
      libvorbis
      SDL2
    ];
}
