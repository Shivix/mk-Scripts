#!/usr/bin/env bash

if [[ $# == 0 ]]; then
  echo "Type mkclass help for usage instructions"
  exit
fi


if [[ $1 == "help" ]]; then
  echo "Type mkclass [name_of_class] [language] (languages can currently be -cpp or -py)"
elif [[ $# == 1 ]]; then
	file_type="-cpp"
else
	file_type=$2
fi 

# Create a C++ class
if [[ $file_type == "-cpp" ]]; then
	while [ ! -f CMakeLists.txt ]
	do
		if [ -d bin ]; then
			echo "Failed to find CMakeLists.txt"
			exit 1;
		fi
		cd ..
	done

	touch src/"$1".cpp
	touch include/"$1".hpp
	echo "#include \"include/$1.hpp\"" >> "src/$1.cpp"

	guard_name=${PWD##*/}_$1_hpp

cat > include/"$1".hpp << EOF
#ifndef ${guard_name}
#define ${guard_name}



#endif //${guard_name}
EOF

# Create a python class
elif [[ $file_type == "-py" ]]; then
  touch "$1.py" 
  echo "class $1:" >> "$1.py"
fi
