#!/bin/bash

set -e

PLATFORM=ubuntu-1804-gcc CONFIG=Debug ./build.sh
PLATFORM=ubuntu-1804-clang CONFIG=Debug ./build.sh

PLATFORM=ubuntu-1804-gcc CONFIG=Release ./build.sh
PLATFORM=ubuntu-1804-clang CONFIG=Release ./build.sh

