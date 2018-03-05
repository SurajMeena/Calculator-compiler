# Calculator-compiler
Hey my name is Suraj and this project is on building a simple calculator compiler and eventually adding new functionalities like recognizing int and float and their flexible use for example what is int divided by a float and so on.
How to run this compiler is written in this readme file
1. open your terminal
2. run your .y file using a parsing application like bison or yacc.
  a) you have to type bison -d file_name.y and hit enter if you are using bison.
3. now run your .l file using lex or flex
  a) just type lex file_name.l and hit enter
4. Now type ls and observe three new files are created lex.yy.c and file_name.tab.c and file_name.tab.h
5.you have to compile two c files using g++/gcc using "gcc lex.yy.c file_name.tab.c" or "g++ lex.yy.c file_name.tab.c" and hit enter.
6.you will get a a.out file run your a.out on a testfile containing the input for your calculator.
7.WHoo its done.
