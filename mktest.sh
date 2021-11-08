#!/usr/bin/env bash

while [ ! -f CMakeLists.txt ]
do
	if [ -d bin ]; then
		echo "Failed to find CMakeLists.txt"
		exit 1;
	fi
	cd ..
done

project_name=${PWD##*/}

mkdir test && cd test || exit

# create CMakeLists.txt with boost.test

touch CMakeLists.txt

cat > ./CMakeLists.txt << EOF
cmake_minimum_required(VERSION 3.16)

project($project_name)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_compile_options(-Wall -Wextra -Wpedantic -Werror)

find_package(Boost REQUIRED COMPONENTS system)
include_directories(${Boost_INCLUDE_DIRS})

add_executable($project_name test.cpp)
target_link_libraries($project_name -lboost_unit_test_framework)
EOF

# create first test.cpp with relevant stuff and empty test

touch test.cpp

cat > ./test.cpp << EOF
#define BOOST_TEST_MODULE $project_name Unit_Test
#ifndef WIN32
    #define BOOST_TEST_DYN_LINK
#else
#endif

#include <boost/test/unit_test.hpp>

BOOST_AUTO_TEST_SUITE(main_test)
    BOOST_AUTO_TEST_CASE(first_test){
		
    }
BOOST_AUTO_TEST_SUITE_END()
EOF

mkdir cmake-build-debug && cd cmake-build-debug || exit
cmake -DCMAKE_BUILD_TYPE=Debug ..
cd ..

mkdir cmake-build-release && cd cmake-build-release || exit
cmake -DCMAKE_BUILD_TYPE=Release ..
cd ..

cp cmake-build-debug/compile_commands.json compile_commands.json
