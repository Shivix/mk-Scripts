#!/usr/bin/env bash

set -e

usage="
Usage: mkbuild [ -r | Build in release mode, debug if not provided ] 
               [ -c | Build using Clang, gcc if not provided ]
               [ -h | --help ]
"
release=false
clang=false
while getopts ":rch" arg; do
  case $arg in
    r)
        release=true
        ;;
    c)
        clang=true
        ;;
    h | *)
        echo "$usage"
        exit 0
        ;;
  esac
done

if [[ ! -f "CMakeLists.txt" ]]; then
    echo "Cannot find CMakeLists.txt"
    exit 1
fi

if $clang ; then
    c_compiler="clang"
    cpp_compiler="clang++"
else
    c_compiler="gcc"
    cpp_compiler="g++"
fi

if $release ; then
    build_dir="cmake-build-release"
    build_mode="Release"
else
    build_dir="cmake-build-debug"
    build_mode="Debug"
fi

mkdir "$build_dir"
cd "$build_dir"

cmake -DCMAKE_BUILD_TYPE=$build_mode -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_C_COMPILER=$c_compiler -DCMAKE_CXX_COMPILER=$cpp_compiler ..
