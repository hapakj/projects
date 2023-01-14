#!/bin/bash

set -e

export OUT_DIR_PATH=/f/programming

PLATFORM=win-msvc2022-x64 CONFIG=Debug ./build.sh
PLATFORM=win-msvc2019-x64 CONFIG=Debug ./build.sh

PLATFORM=win-msvc2022-x64 CONFIG=Release ./build.sh
PLATFORM=win-msvc2019-x64 CONFIG=Release ./build.sh
