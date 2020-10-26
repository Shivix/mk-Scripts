#!/usr/bin/env bash

if [[ $2 = "-cpp" ]]; then # Create a C++ class
	touch "$1.cpp"
	touch "$1.hpp"
	echo "#include \"$1.hpp\"" >> "$1.cpp"
	printf "#ifndef %s_HPP\n#define %s_HPP\n\nclass %s {\n\n}\n\n#endif //%s_HPP" "${1^^}" "${1^^}" "$1" "${1^^}" >> "$1.hpp"
fi 

if [[ $2 = "-py" ]]; then
  touch "$1.py" 
  echo "class $1:" >> "$1.py"
fi