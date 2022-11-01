{ callPackage
, lib
, stdenv
, fetchFromGitHub
, cmake
, libpng
, libGL
, libGLU
, glew
, xlibsWrapper
}:

stdenv.mkDerivation {
  pname = "olcPixelGameEngine";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "smarwei";
    repo = "olcPixelGameEngine";
    rev = "master";
    sha256 = "sha256-5v7ICJVNitz5pP863J09U9zVI6UI9bdG9LiVxoBgH8w=";
  };

  nativeBuildInputs = [
    cmake
    libGL
    libGLU
    glew
    xlibsWrapper
    libpng
  ];
  buildInputs = [];

  cmakeFlags = [
  ];

  meta = with lib; {
    description = "A C++11 single-file header-only cross platform HTTP/HTTPS library.";
    longDescription = ''
      A C++11 single-file header-only cross platform HTTP/HTTPS library.

      It's extremely easy to setup. Just include the httplib.h file in your code!

      NOTE: This library uses 'blocking' socket I/O. If you are looking for a library with 'non-blocking' socket I/O, this is not the one that you want.
    '';
    homepage = "https://github.com/saucer/saucer";
    #changelog = "https://git.savannah.gnu.org/cgit/hello.git/plain/NEWS?h=v${finalAttrs.version}";
    license = licenses.mit;
    maintainers = [ maintainers.eelco ];
    platforms = platforms.all;
  };
}

