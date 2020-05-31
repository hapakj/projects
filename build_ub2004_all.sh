#!/bin/bash

set -e

PLATFORM=ubuntu-2004-gcc CONFIG=Debug ./build.sh
PLATFORM=ubuntu-2004-clang CONFIG=Debug ./build.sh

