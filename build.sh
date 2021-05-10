#!/usr/bin/env bash

set -ex
DIR=$(cd "$(dirname "$0")"; pwd)
cd $DIR

docker build -t rmw-deno-rust .
