#!/usr/bin/env bash
set -e
_DIR=$(cd "$(dirname "$0")"; pwd)
cd $_DIR

./build.sh
docker push rmwl/deno-rust
