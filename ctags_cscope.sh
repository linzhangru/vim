#!/bin/sh
find . -name "*.h" -o -name "*.H" -o -name "*.c" -o -name "*.C" -o -name "*.S" -o -name "*.s" -o -name "*.cc" -o -name "*.CC" -o -name "*.cpp" -o -name "*.cPP" -o -name "*.CPP" -o -name "*.java" -name "*.JAVA"> cscope.files
cscope -Rbkq -i cscope.files
ctags -R
