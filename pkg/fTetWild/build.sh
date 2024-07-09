#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

case $RUNNER_OS in
  Linux) ;;
  Windows) exit 1 ;;
  macOS) ;;
esac

DIST_DIR=${DIST_DIR:-dist}

mkdir -p -v "build"
pushd "build"
cmake ..
make -j
mkdir -p -v "$DIST_DIR"
install -m u=rwx,go=rx -v FloatTetwild_bin "$DIST_DIR/fTetWild-${RUNNER_ARCH}-${RUNNER_OS}"
popd
