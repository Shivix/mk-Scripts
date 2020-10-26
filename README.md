# mkclass

mkclass allows you to easily create a class for C++ or Python

It will create the required files and fill out the basic syntax for the creation of a class.\
For example a .hpp file will contain:
```Cpp
#ifndef EXAMPLE_HPP
#define EXAMPLE_HPP

class example {

};

#endif //EXAMPLE_HPP
```

This is used at the command line by typing mkclass name_of_class -cpp(or -py for python)\
Example: mkclass example -cpp

This can also be used within vim however it will not inherit the alias so one must type :!mkclass.sh name -language

# Installation

First clone the repository using `git clone https://github.com/Shivix/mkclass.git`

Then run `cd mkclass`

Then run `sudo cp ./mkclass.sh /usr/local/bin` You may also create a bin directory within home and add that to your environment variables and copy the file to there.

Then run `sudo chmod +x /usr/local/bin/mkclass.sh` to make the new file executable.

Finally open up ~/.bashrc in your text editor of choice and add the following line to it:\
`alias mkclass="mkclass.sh"`\
This makes the script executable using mkclass rather than mkclass.sh.

