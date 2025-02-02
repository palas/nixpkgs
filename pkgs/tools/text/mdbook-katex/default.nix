{ lib, stdenv, fetchCrate, rustPlatform, openssl, CoreServices }:

rustPlatform.buildRustPackage rec {
  pname = "mdbook-katex";
  version = "0.3.3";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-PmNoux12A6MBlviyCy9kjGUHigBDxCiiqXlwf6Sc76I=";
  };

  cargoHash = "sha256-YSLJsiIkoeSAh3oUMkbk5jSW0NMdJLB6YsOt1YlGyfs=";

  OPENSSL_DIR = "${lib.getDev openssl}";
  OPENSSL_LIB_DIR = "${lib.getLib openssl}/lib";

  buildInputs = lib.optionals stdenv.isDarwin [ CoreServices ];

  meta = with lib; {
    description = "A preprocessor for mdbook, rendering LaTeX equations to HTML at build time.";
    homepage = "https://github.com/lzanini/${pname}";
    license = [ licenses.mit ];
    maintainers = with maintainers; [ lovesegfault ];
  };
}
