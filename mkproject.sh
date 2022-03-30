#!/usr/bin/env bash

set -e

usage="
Usage: mkproject <project_name>
"

while getopts ":h" arg; do
    case $arg in
    h | *)
        echo "$usage"
        exit 0
        ;;
    esac
done

if [[ ! $# == 1 ]]; then
  echo "$usage"
  exit 0
fi

# create CMakeLists.txt & fill with contents
mkdir "$1" && cd "$1"

touch CMakeLists.txt

cat > ./CMakeLists.txt << EOF
cmake_minimum_required(VERSION 3.16)

project($1)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_compile_options(-Wall -Wextra -Wpedantic -Werror)

add_executable($1 src/main.cpp)
EOF

mkdir src
mkdir include

# create & fill main file
touch src/main.cpp
cat > src/main.cpp << EOF
#include <iostream>

int main (){
	std::cout << "Hello world!\n";
	return 0;
}
EOF
