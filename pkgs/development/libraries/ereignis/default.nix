{ callPackage
, lib
, stdenv
, fetchFromGitHub
, cmake
}:

stdenv.mkDerivation {
  pname = "ereignis";
  version = "1.1";

  src = fetchFromGitHub {
    owner = "Soundux";
    repo = "ereignis";
    rev = "v1.1";
    sha256 = "sha256-2cJoHoGG4BXZzqMQ47RlS/JzCMeHew+5/mC2OBrHDKs=";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ ];

  cmakeFlags = [ 
  ];

  meta = with lib; {
    description = " A thread-safe C++17 Event Library";
    longDescription = ''
      Ereignis is a library that implements an easy to use Event/Callback mechanism.
      With Ereignis it's possible to (un)register callbacks to an event_manager, clear all the registered callbacks and also fire a specific event, which in turn will invoke all registered callbacks.
      When the specified callback does not return void it is possible to iteratively invoke the callbacks and receive their result.
    '';
    homepage = "https://github.com/Soundux/ereignis";
    #changelog = "https://git.savannah.gnu.org/cgit/hello.git/plain/NEWS?h=v${finalAttrs.version}";
    license = licenses.mit;
    maintainers = [ maintainers.eelco ];
    platforms = platforms.all;
  };
}

