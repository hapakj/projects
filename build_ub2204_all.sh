#!/bin/bash

set -e

PLATFORM=ubuntu-2204-gcc CONFIG=Debug ./build.sh
PLATFORM=ubuntu-2204-clang CONFIG=Debug ./build.sh

PLATFORM=ubuntu-2204-gcc CONFIG=Release ./build.sh
PLATFORM=ubuntu-2204-clang CONFIG=Release ./build.sh

