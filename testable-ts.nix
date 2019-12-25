{ 
  version,
  sha256,
  patches,
  stdenv, 
  nodejs,
  jq,
  moreutils,
  ...
}: stdenv.mkDerivation {
    name = "testable-ts";
    src = builtins.fetchTarball { 
      url = "https://registry.npmjs.org/typescript/-/typescript-${version}.tgz";
      inherit sha256;
    };

    inherit patches;

    buildPhase = ''
        NAME=v$(echo ${version} | sed  's/\.[0-9]*$//')
        jq ".name=\"@testable-ts/$NAME\"" < package.json | sponge package.json
        npm pack --ignore-scripts
    '';

    installPhase = ''
        mkdir $out
        cp testable-ts-$NAME-${version}.tgz $out/
    '';

    buildInputs = [ nodejs jq moreutils ];
}