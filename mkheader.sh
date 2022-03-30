#!/usr/bin/env bash

set -e

usage="
Usage: mkheader <header_name>
"

while getopts ":h" arg; do
  case $arg in
    h | *)
        echo "$usage"
        exit 0
        ;;
  esac
done

if [[ ! $# == 1 ]]; then
  echo "$usage"
  exit 0
fi

while [ ! -f CMakeLists.txt ]
do
	if [ -d bin ]; then
		echo "Failed to find CMakeLists.txt"
		exit 1;
	fi
	cd ..
done

touch include/"$1".hpp

cap_pwd=${PWD^^}
guard_pwd=$(echo $cap_pwd | sed 's/-//g')
guard_name=${guard_pwd##*/}_${1^^}_HPP

cat > include/"$1".hpp << EOF
#ifndef ${guard_name}
#define ${guard_name}



#endif //${guard_name}
EOF
