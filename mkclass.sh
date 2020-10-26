#!/usr/bin/env bash

if [[ $# == 0 ]]; then # checks if the command was run without arguments
  echo "Type mkclass help for usage instructions"
fi

if [[ $1 == "help" ]]; then
  echo "Type mkclass [name_of_class] [language] (languages can currently be -cpp or -py) Please refer to README for more info"
elif [[ $# == 1 ]]; then
  echo "Please add a language argument. Type mkclass help for more info."
fi 

if [[ $2 == "-cpp" ]]; then # Create a C++ class
	touch "$1.cpp"
	touch "$1.hpp"
	echo "#include \"$1.hpp\"" >> "$1.cpp"
	printf "#ifndef %s_HPP\n#define %s_HPP\n\nclass %s {\n\n};\n\n#endif //%s_HPP" "${1^^}" "${1^^}" "$1" "${1^^}" >> "$1.hpp"

elif [[ $2 == "-py" ]]; then # Create a python class
  touch "$1.py" 
  echo "class $1:" >> "$1.py"
fi