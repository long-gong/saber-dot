#!/usr/bin/env bash

set -e
cd "$(dirname "$0")"/..
git submodule update --init --recursive

cd "$(dirname "$0")"
chmod +x ./clone_nested_submodules.py
./clone_nested_submodules.py


