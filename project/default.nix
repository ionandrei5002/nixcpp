with import <nixpkgs> {};

{ stdenv, fetchzip, cmake, gcc8, sfml, libX11, freetype, libjpeg, openal, flac, libvorbis
, glew, libXrandr, libXrender, udev, xcbutilimage
}:

let
  version = "2.5.1";
in

stdenvNoCC.mkDerivation {
  name = "project-${version}";
  
  src = ./.;

  nativeBuildInputs = [ cmake ];
  buildInputs = [ gcc8 sfml libX11 freetype libjpeg openal flac libvorbis glew
                  libXrandr libXrender xcbutilimage
                ] ++ stdenv.lib.optional stdenv.isLinux udev;

  meta = with stdenv.lib; {
    homepage = http://www.sfml-dev.org/;
    description = "Simple and fast multimedia library";
    longDescription = ''
      SFML is a simple, fast, cross-platform and object-oriented multimedia API.
      It provides access to windowing, graphics, audio and network.
      It is written in C++, and has bindings for various languages such as C, .Net, Ruby, Python.
    '';
    license = licenses.zlib;
    maintainers = [ maintainers.astsmtl ];
    platforms = platforms.unix;
  };
}