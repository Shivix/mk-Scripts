#!/usr/bin/env bash

if [[ $2 = '-cpp' ]]; then
	touch "$1.cpp"
	touch "$1.hpp"
fi
