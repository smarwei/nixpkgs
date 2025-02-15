{ lib
, buildPythonPackage
, pythonOlder
, fetchPypi
, click
, click-default-group
, docformatter
, jinja2
, toposort
, lxml
, requests
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "xsdata";
  version = "22.9";

  disabled = pythonOlder "3.7";

  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-xi1QArTeWbrKTE6p7f3Aj7d1lxPsIROaruv/IMw+fPw=";
  };

  postPatch = ''
    substituteInPlace setup.cfg \
      --replace "--benchmark-skip" ""
  '';

  passthru.optional-dependencies = {
    cli = [
      click
      click-default-group
      docformatter
      jinja2
      toposort
    ];
    lxml = [
      lxml
    ];
    soap = [
      requests
    ];
  };

  checkInputs = [
    pytestCheckHook
  ] ++ passthru.optional-dependencies.cli
    ++ passthru.optional-dependencies.lxml
    ++ passthru.optional-dependencies.soap;

  disabledTestPaths = [
    "tests/integration/benchmarks"
  ];

  pythonImportsCheck = [
    "xsdata.formats.dataclass.context"
    "xsdata.formats.dataclass.models.elements"
    "xsdata.formats.dataclass.models.generics"
    "xsdata.formats.dataclass.parsers"
    "xsdata.formats.dataclass.parsers.handlers"
    "xsdata.formats.dataclass.parsers.nodes"
    "xsdata.formats.dataclass.serializers"
    "xsdata.formats.dataclass.serializers.config"
    "xsdata.formats.dataclass.serializers.mixins"
    "xsdata.formats.dataclass.serializers.writers"
    "xsdata.models.config"
    "xsdata.utils.text"
  ];

  meta = {
    description = "Python XML Binding";
    homepage = "https://github.com/tefra/xsdata";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ dotlambda ];
  };
}
