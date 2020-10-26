#!/usr/bin/env bash

if [[ $2 = '-cpp' ]]; then # Create a C++ class
	touch "$1.cpp"
	touch "$1.hpp"
	echo "#include \"$1.hpp\"" >> "$1.cpp"
	printf "#ifndef %s_HPP\n
	        #define %s_HPP\n\n
	        class %s {\n
	        \n
	        }\n
	        #endif //%s_HPP" "$1" "$1" "$1" "$1" >> "$1.hpp"
fi 
