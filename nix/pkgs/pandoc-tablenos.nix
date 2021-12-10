{ fetchFromGitHub, buildPythonApplication, lib, pandoc-xnos }:

buildPythonApplication rec {
  pname = "pandoc-tablenos";
  version = "2.3.0";

  src = fetchFromGitHub {
    repo = "pandoc-tablenos";
    owner = "tomduck";
    rev = version;
    sha256 = "10lww30n7a2c82l3x2hhv8xlxay3iddj0qcg98rgmp4q713yq30p";
  };

  propagatedBuildInputs = [ pandoc-xnos ];

  # No automated tests
  doCheck = false;

  meta = with lib; {
    homepage = src.meta.homepage;
    description = ''
      A pandoc filter for numbering tables and table references.
    '';
    license = with licenses; [ gpl3Only ];
  };
}
