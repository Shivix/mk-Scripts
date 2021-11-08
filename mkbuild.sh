#!/usr/bin/env bash

if [[ $# != 1 ]]; then
  echo "Please specify release, debug, clang-release or clang-debug"
  exit
fi

if [[ $1 == "release" || $1 == "clang-release" ]]; then
    build_type="Release"
elif [[ $1 == "debug" || $1 == "clang-debug" ]]; then
    build_type="Debug"
else
    echo "Please specify release, debug, clang-release or clang-debug"
    exit
fi

if [[ $1 == "clang-debug" || $1 == "clang-release" ]]; then
    c_compiler="clang"
    cpp_compiler="clang++"
else
    c_compiler="gcc"
    cpp_compiler="g++"
fi

build_dir=cmake-build-$1
mkdir "$build_dir"
cd "$build_dir" || exit

cmake -DCMAKE_BUILD_TYPE=$build_type -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_INSTALL_PREFIX=./install -DCMAKE_C_COMPILER=$c_compiler -DCMAKE_CXX_COMPILER=$cpp_compiler ..

