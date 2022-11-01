{ callPackage
, lib
, stdenv
, fetchFromGitHub
, cmake
, zlib
, openssl
, qt6
, nlohmann_json
, fmt_9
, tl-expected
, lockpp
, ereignis
}:

#set qt6 in cmakeFlags before even building in here
stdenv.mkDerivation {
  pname = "saucer";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "saucer";
    repo = "saucer";
    rev = "dev";
    sha256 = "sha256-wt3AxME3bkBRBJxpOI6MYnlGNspWL7N33GCx6J6jzpg";
  };

  nativeBuildInputs = [
    lockpp
    ereignis
    tl-expected
    fmt_9
    nlohmann_json
    cmake
    qt6.qtwebchannel
    qt6.qtwebview
    qt6.wrapQtAppsHook
  ];
  buildInputs = [];

  cmakeFlags = [
    "-Dsaucer_backend=Qt6"
    "-Dsaucer_prefer_remote=OFF"
    "-Dsaucer_shared=ON"
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

