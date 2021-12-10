{ fetchFromGitHub, buildPythonApplication, lib }:

buildPythonApplication rec {
  pname = "errorhandler";
  version = "2.0.1";

  src = fetchFromGitHub {
    repo = "errorhandler";
    owner = "simplistix";
    rev = version;
    sha256 = "1cp6v2zybhdpaifcp57yws71m7rnl9namk5hcn4i78jfv3i8gi74";
  };

  propagatedBuildInputs = [ ];

  # No automated tests
  # doCheck = false;

  meta = with lib; {
    homepage = src.meta.homepage;
    description = ''
      This is a handler for the python standard logging framework that can be used to tell whether messages have been logged at or above a certain level.
    '';
    license = with licenses; [ mit ];
  };
}
