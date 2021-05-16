#!/usr/bin/env bash

if [[ $# == 0 ]]; then
  echo "Please include the name of the header"
  exit
fi

while [ ! -f CMakeLists.txt ]
do
	if [ -d bin ]; then
		echo "Failed to find CMakeLists.txt"
		exit -1;
	fi
	cd ..
done

touch include/$1.hpp

guard_name=${PWD##*/}_$1_hpp

cat > include/$1.hpp << EOF
#ifndef ${guard_name}
#define ${guard_name}



#endif //${guard_name}
EOF
