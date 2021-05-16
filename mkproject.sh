#!/usr/bin/env bash

if [[ $# == 0 ]]; then # checks if the command was run without arguments
  echo "Please include project name as argument"
  exit
fi

# create CMakeLists.txt & fill with contents
mkdir $1 && cd $1

touch CMakeLists.txt

cat > ./CMakeLists.txt << EOF
cmake_minimum_required(VERSION 3.16)

project($1)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_compile_options(-Wall -Wextra -Wpedantic -Werror)

add_executable($1 src/main.cpp)
EOF

# create directories src/ inc etc. test if lib
mkdir src
mkdir include

# create main file if not lib
touch src/main.cpp
cat > src/main.cpp << EOF
#include <iostream>

int main (){

	std::cout << "Hello world!\n";
	return 0;
}
EOF
# run cmake for debug and release

mkdir Debug && cd Debug
cmake -DCMAKE_BUILD_TYPE=Debug ..
cd ..

mkdir Release && cd Release
cmake -DCMAKE_BUILD_TYPE=Release ..
cd ..

cp Debug/compile_commands.json compile_commands.json
