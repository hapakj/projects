#!/bin/bash

: ${PLATFORM:?"PLATFORM not set"}
: ${CONFIG:?"CONFIG not set"}
: ${OUT_DIR_PATH:=.}

function create_and_go_to_out_dir {
    OUT_DIR_NAME=$OUT_DIR_PATH/out_projects_$PLATFORM

    # on linux we also append the configuration
    if [ "$PLATFORM" == "linux-clang" ] || [ "$PLATFORM" == "linux-gcc" ] ; then
        OUT_DIR_NAME="$OUT_DIR_NAME"_"$CONFIG"
    fi

    mkdir -p $OUT_DIR_NAME
    cd $OUT_DIR_NAME
}

CURRENT_DIR=${PWD}

create_and_go_to_out_dir

case $PLATFORM in
    win-msvc2019-x64)
        cmake -G "Visual Studio 16 2019" -A x64 ${CURRENT_DIR}
        cmake --build . --config $CONFIG
    ;;

    win-msvc2019-x86)
        cmake -G "Visual Studio 16 2019" -A Win32 ${CURRENT_DIR}
        cmake --build . --config $CONFIG
    ;;

    win-msvc2017-x64)
        cmake -G "Visual Studio 15 2017 Win64" ${CURRENT_DIR}
        cmake --build . --config $CONFIG
    ;;

    win-msvc2017-x86)
        cmake -G "Visual Studio 15 2017" ${CURRENT_DIR}
        cmake --build . --config $CONFIG
    ;;

    win-clang-x64)
        cmake -G "Visual Studio 15 2017 Win64" -T "llvm-vs2014" ${CURRENT_DIR} 
        cmake --build . --config $CONFIG
    ;;

    win-clang-x86)
        cmake -G "Visual Studio 15 2017" -T "llvm-vs2014" ${CURRENT_DIR} 
        cmake --build . --config $CONFIG
    ;;  

    linux-clang)
        export CC=/usr/bin/clang
        export CXX=/usr/bin/clang++

        cmake -DCMAKE_BUILD_TYPE=$CONFIG ${CURRENT_DIR} 
        cmake --build .
    ;;

    linux-gcc)
        export CC=/usr/bin/gcc
        export CXX=/usr/bin/g++

        cmake -DCMAKE_BUILD_TYPE=$CONFIG ${CURRENT_DIR} 
        cmake --build .
    ;;

    *)
      echo "Unsupported platform"
      exit 1
    ;;
esac
