{ callPackage
, lib
, stdenv
, fetchFromGitHub
, cmake
}:

stdenv.mkDerivation {
  pname = "lockpp";
  version = "1.0.2";

  src = fetchFromGitHub {
    owner = "Soundux";
    repo = "lockpp";
    rev = "v1.0.2";
    sha256 = "sha256-Z3J71AulADmfQll8uBDMYysMeEzeRhAzWaFsAh9hV6E=";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ ];

  cmakeFlags = [ 
    "-DHTTPLIB_COMPILE=on"
  ];

  meta = with lib; {
    description = "A C++17 library that provides mutex protection for objects";
    homepage = "https://github.com/Soundux/lockpp";
    #changelog = "https://git.savannah.gnu.org/cgit/hello.git/plain/NEWS?h=v${finalAttrs.version}";
    license = licenses.mit;
    maintainers = [ maintainers.eelco ];
    platforms = platforms.all;
  };
}

