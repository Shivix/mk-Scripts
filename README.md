# mk Scripts

These are a collection of scripts to create parts of projects when programming

Note: currently all besides mkclass are only for C++. **IMPORTANT** most scripts assume your project directory is laid out in the way mkproject sets it

mkproject [name] creates a directory named after the project, an include and src folder and a basic CMakeLists.txt.

mkclass [name] creates a class for C++ or Python

mkheader [name] creates a header file in the include folder

It will create the required files and fill out the basic syntax for the creation of a class.\
For example a basic .hpp file will contain:
```cpp
#ifndef PROJECTNAME_EXAMPLE_HPP
#define PROJECTNAME_EXAMPLE_HPP



#endif //PROJECTNAME_EXAMPLE_HPP
```

# Installation

First clone the repository using `git clone https://github.com/Shivix/mkclass.git`

Then just run `make install`
