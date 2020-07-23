# Latest Nightly
let pkgs = import ./pkgs.nix {
    config = {
      packageOverrides = pkgs: with pkgs; {
        clunk = pkgs.callPackage ./clunk.nix {};
      };
    };
  };
in pkgs.stdenv.mkDerivation rec {
  name = "Vangers";
  src = ./.;
  nativeBuildInputs = with pkgs; [ pkgconfig cmake ];
  buildInputs = with pkgs; [
    SDL2
    SDL2_net
    libogg
    libvorbis
    ffmpeg-full
    clunk
    zlib

    # Other packages
    pkgconfig
    git
    libGL
    xorg.libxcb
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXrandr
  ];
  installPhase = ''
    mkdir -p $out/bin
    ls lib
    exit 1
  '';
  LD_LIBRARY_PATH = with pkgs; "/run/opengl-driver/lib:/run/opengl-driver-32/lib:${libGL}/lib:${xorg.libX11}/lib:${xorg.libXcursor}/lib:${xorg.libXrandr}/lib:${xorg.libXi}/lib";
}
