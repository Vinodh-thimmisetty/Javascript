#!/bin/bash
# Courtesy:: https://bash.cyberciti.biz/guide/Main_Page
# Arithmetic Expressioin has to be

 $(( a+2 ))
 $(( a-2 ))
 $(( a/2 ))
 $(( a*2 ))
 $(( a%2 ))
 $(( a++ )) $(( ++a ))
 $(( a-- )) $(( --a ))
 $(( a**y )) --> Math.pow(a,y)
# There must be always spaces btwn operators and operands or any symbols

# To check Even or Odd using IF..FI.
val = 4;
if [[ $((val%2)) == 0 ]]; then
  #statements
  echo "Even Number";
else
  echo "Odd Number";
fi

#Print Even Number by Using of STEPs inside For loop

for i in {0..99..2}
do
  echo $i;
done

# User Input- Always adwiced to put the string in QUOTES
# No need to end with semi-colon if it is single line
read name
echo "Hello $name !";

# Case Sensitive Comparisions

"${var1,,}" == "${var2,,}"
"${var1^^}" == "${var2^^}"

# Use basic calculator + printf commands for floating point Arithmetic operations
printf "%0.3f" "$( echo $input | bc)"
