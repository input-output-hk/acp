{ fetchFromGitHub, buildPythonApplication, lib, pandocfilters, psutil }:

buildPythonApplication rec {
  pname = "pandoc-xnos";
  version = "2.5.0";

  src = fetchFromGitHub {
    repo = "pandoc-xnos";
    owner = "tomduck";
    rev = version;
    sha256 = "1r9d58ahv50n9pjpv9c0ccrh1v0f6fm0rp2qq0yanjq3vny8ds3d";
  };

  propagatedBuildInputs = [ pandocfilters psutil ];

  # No automated tests
  doCheck = false;

  meta = with lib; {
    homepage = src.meta.homepage;
    description = ''
      Library code for pandoc-fignos/eqnos/tablenos/secnos.
    '';
    license = with licenses; [ gpl3Only ];
  };
}
