#!/usr/bin/env bash

if [[ $2 = '-cpp' ]]; then
	touch "$1.cpp"
	touch "$1.hpp"
	echo "#include \"$1.hpp\"" >> "$1.cpp"
fi
