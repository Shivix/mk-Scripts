#!/usr/bin/env bash

if [[ $# == 0 ]]; then
  echo "Please include project name as argument"
  exit
fi

# create CMakeLists.txt & fill with contents
mkdir "$1" && cd "$1" || exit

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

mkdir cmake-build-debug && cd cmake-build-debug || exit
cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=./install/ ..
cd ..

mkdir cmake-build-release && cd cmake-build-release || exit
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=./install/ ..
cd ..

cp cmake-build-debug/compile_commands.json compile_commands.json
