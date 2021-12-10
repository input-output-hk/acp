{ fetchFromGitHub, buildPythonApplication, lib, pandoc-xnos }:

buildPythonApplication rec {
  pname = "pandoc-eqnos";
  version = "2.5.0";

  src = fetchFromGitHub {
    repo = "pandoc-eqnos";
    owner = "tomduck";
    rev = version;
    sha256 = "1djbbhhk58y79h9n0nn1ayha9x3h4qingglj5lx0pdg1c5y1sr7c";
  };

  propagatedBuildInputs = [ pandoc-xnos ];

  # No automated tests
  doCheck = false;

  meta = with lib; {
    homepage = src.meta.homepage;
    description = ''
      A pandoc filter for numbering equations and equation references.
    '';
    license = with licenses; [ gpl3Only ];
  };
}
