{ fetchFromGitHub, buildPythonApplication, lib, pytest }:

buildPythonApplication rec {
  pname = "base62";
  version = "0.4.3";

  src = fetchFromGitHub {
    repo = "base62";
    owner = "suminb";
    rev = version;
    sha256 = "1v24fx0mnvwar3mfhby3qirgiafl5iiwfk3fg8h4xm8nmm7bw9v6";
  };

  propagatedBuildInputs = [ pytest ];

  # No automated tests
  # doCheck = false;

  meta = with lib; {
    homepage = src.meta.homepage;
    description = ''
      Python module for base62 encoding; a URL-safe encoding for arbitrary data.
    '';
    license = with licenses; [ bsd2 ];
  };
}
