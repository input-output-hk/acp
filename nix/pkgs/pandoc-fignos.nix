{ fetchFromGitHub, buildPythonApplication, lib, pandoc-xnos }:

buildPythonApplication rec {
  pname = "pandoc-fignos";
  version = "2.4.0";

  src = fetchFromGitHub {
    repo = "pandoc-fignos";
    owner = "tomduck";
    rev = version;
    sha256 = "1f88d6avg4kd7r7fp5zhil1zarbfglxh5xv4mlm8c1yb95dh0g3q";
  };

  propagatedBuildInputs = [ pandoc-xnos ];

  # No automated tests
  doCheck = false;

  meta = with lib; {
    homepage = src.meta.homepage;
    description = ''
      A pandoc filter for numbering figures and figure references.
    '';
    license = with licenses; [ gpl3Only ];
  };
}
