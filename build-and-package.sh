#!/bin/sh

set -eu

docker build -t ghc-builder build/

if [[ -e package/ghc-head ]]; then
  echo Using cached ghc-head
else
  echo Rebuilding ghc
  docker run -it -v "$(pwd)/package/ghc-head:/opt/ghc/head" ghc-builder /build-ghc.sh
fi

docker build -t packaged-ghc-head package/