{ callPackage
, lib
, stdenv
, fetchFromGitHub
, cmake
, zlib
, openssl
, brotli
, python3Minimal
}:

stdenv.mkDerivation {
  pname = "httplib";
  version = "0.11.2";

  src = fetchFromGitHub {
    owner = "yhirose";
    repo = "cpp-httplib";
    rev = "v0.11.2";
    sha256 = "sha256-7+e8zxD77Ya8JRy2ccCBgE00g3F/Pk1cR7+90GgchrA=";
  };

  nativeBuildInputs = [ cmake python3Minimal ];
  buildInputs = [ openssl zlib brotli ];

  cmakeFlags = [ 
    "-DHTTPLIB_COMPILE=on"
    "-DBUILD_SHARED_LIBS=on"
    "-DHTTPLIB_REQUIRE_ZLIB=on"
    "-DHTTPLIB_REQUIRE_BROTLI=on"
  ];

  meta = with lib; {
    description = "A C++11 single-file header-only cross platform HTTP/HTTPS library.";
    longDescription = ''
      A C++11 single-file header-only cross platform HTTP/HTTPS library.

      It's extremely easy to setup. Just include the httplib.h file in your code!

      NOTE: This library uses 'blocking' socket I/O. If you are looking for a library with 'non-blocking' socket I/O, this is not the one that you want.
    '';
    homepage = "https://github.com/yhirose/cpp-httplib";
    #changelog = "https://git.savannah.gnu.org/cgit/hello.git/plain/NEWS?h=v${finalAttrs.version}";
    license = licenses.mit;
    maintainers = [ maintainers.eelco ];
    platforms = platforms.all;
  };
}

