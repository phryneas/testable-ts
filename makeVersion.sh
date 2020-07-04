#!/usr/bin/env bash
cd "$( dirname "${BASH_SOURCE[0]}" )"
DIR=$(pwd)

VERSION=$1
if [ -z "$VERSION" ]; then 
    echo version required as first argument
    exit 1
fi

OUT=$(nix-prefetch-url --type sha256 --unpack --print-path "https://registry.npmjs.org/typescript/-/typescript-${VERSION}.tgz")
HASH=$(echo $OUT | cut -f1 -d' ')
OUT=$(echo $OUT | cut -f2 -d' ')

(
    TMP=${DIR}/tmp/${VERSION}
    mkdir -p "${TMP}/"{a,b}/lib
    cd "${TMP}"
    pwd
    cp --no-preserve=mode "$OUT/lib/typescript.js" a/lib
    sed -re '/var checker = \{/a isTypeIdenticalTo: isTypeIdenticalTo, isTypeAssignableTo: isTypeAssignableTo,' a/lib/typescript.js >| b/lib/typescript.js
    diff -Naur a b > "${DIR}/patches/${VERSION}.patch"
    rm -r "${TMP}"
)   
sed -i -e "/^\s*$/d" -e "/#NEXT-HERE/i \\\\n$(
cat <<EOF | awk 1 ORS='\\n' 
        ( callPackage ./testable-ts.nix {
            version = "${VERSION}";
            sha256 = "${HASH}";
            patches = [ ./patches/${VERSION}.patch ];
            suffix = "-alpha.0";
        })
EOF
)"  default.nix