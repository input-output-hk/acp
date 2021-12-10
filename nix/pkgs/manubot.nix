{ fetchFromGitHub, buildPythonApplication, lib, panflute, ratelimiter,
  requests, requests-cache, toml, packaging, errorhandler, base62,
  jsonschema, jinja2, isbnlib
}:

buildPythonApplication rec {
  pname = "manubot";
  version = "v0.5.1";

  src = fetchFromGitHub {
    repo = "manubot";
    owner = "manubot";
    rev = version;
    sha256 = "11gmv9rr0jvi54k2d59jm454mi1h5lz8321fw6yi90a7s5h0iqwm";
  };

  propagatedBuildInputs = [
    base62
    errorhandler
    isbnlib
    jinja2
    jsonschema
    packaging
    panflute
    ratelimiter
    requests
    requests-cache
    toml
  ];

  # No automated tests
  doCheck = false;

  meta = with lib; {
    homepage = src.meta.homepage;
    description = ''
      Python utilities for Manubot: Manuscripts, open and automated
    '';
    license = with licenses; [ bsd2Patent ];
  };
}
