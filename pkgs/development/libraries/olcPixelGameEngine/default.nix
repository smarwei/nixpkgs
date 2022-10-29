{ callPackage
, lib
, stdenv
, fetchFromGitHub
, cmake
, libpng
, libGL
, glew
, xlibsWrapper
}:

stdenv.mkDerivation {
  pname = "olcPixelGameEngine";
  version = "1.4.0";

  src = fetchFromGitHub {
    owner = "smarwei";
    repo = "olcPixelGameEngine";
    rev = "master";
    sha256 = "sha256-YNd7rgnYWevwkNKcR2x3Mv2+pL5kS8a8sLIZvCpyKdk=";
  };

  nativeBuildInputs = [
    cmake
    libGL
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

