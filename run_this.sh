#! /bin/sh
if [ "$1" != "" ]; then
	X=`basename $1 .cpp`
	mv -i template.cpp $X.cpp
	echo "cmake_minimum_required(VERSION 2.8)" > CMakeLists.txt
	echo "project( $X )" >> CMakeLists.txt
	echo "find_package( OpenCV REQUIRED )" >> CMakeLists.txt
	echo "add_executable( $X $1 )" >> CMakeLists.txt
	echo "target_link_libraries( $X "'${OpenCV_LIBS} )' >> CMakeLists.txt
	echo "Done making CMakeLists.txt file" 1>&2
	rm -i README.md
	mkdir build
	rm -rfI .git/ && git init && git add *.cpp
	echo "Done initializing a new repository" 1>&2
	rm -i $0
	echo "Done!"
else
	echo "Usage: $0 {name of filter}" 1>&2
fi
