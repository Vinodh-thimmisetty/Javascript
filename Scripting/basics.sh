#!/bin/bash
# Courtesy:: https://bash.cyberciti.biz/guide/Main_Page
# Arithmetic Expressioin has to be

echo $? --> Exit status of previous command

 $(( a+2 ))
 $(( a-2 ))
 $(( a/2 ))
 $(( a*2 ))
 $(( a%2 ))
 $(( a++ )) $(( ++a ))
 $(( a-- )) $(( --a ))
 $(( a**y )) --> Math.pow(a,y)

# Dynamic Arithmetic Operations
 x=10;y=20;z=any(+,-,*,/,%)
 echo $(( $x$z$y ))

# test conditions:
test condtion && "What if TRUE" || "What if FALSE"
e.g:
test 5 -eq 5 && echo "TRUE" || echo "FALSE"
test -f vin && echo "File exists" || echo "File Not found"

test -z $vin --> EMpty/Zero length String
test "$vin" == "Vinodh"
test "$vin" != "Vinodh"


#Conditional Expressions

[ 5 == 5 ] && echo "True" || echo "False"

# There must be always spaces btwn operators and operands or any symbols
read -p "Enter a Number" num
if [ test $num == 5 || test $num !=10 || test $num -gt 10 ]
then
  echo "true"
elif [ test "$num" == "vinodh"   || test "$num" == "Kumar" ]
then
  echo "name invalid"
else
  echo "false"
fi

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

# case statement
read -p "Enter the name" name
case $name in
        vin|odh|kum|ar)
        echo "Valid Operator"
        ;;
        *) --> Default case which is mandatory
        echo " Invalid Operator"
        ;;
esac

# User Input- Always adwiced to put the string in QUOTES
# No need to end with semi-colon if it is single line
read name
echo "Hello $name !";

# Case Sensitive Comparisions

"${var1,,}" == "${var2,,}"
"${var1^^}" == "${var2^^}"

tr '[:upper:]' '[:lower:]' <<< "$name"
#using Regex patterns
$name =~ [A-a][1-8]+

# Using Shell options
shopt -s nocasematch
  // do the Comparisions
shopt -u nocasematch

# Use basic calculator + printf commands for floating point Arithmetic operations
printf "%0.3f" "$( echo $input | bc)"


#Commond Line Arguments
All command line parameters or arguments can be accessed via $1, $2, $3,..., $9.
$* holds all command line parameters or arguments.
$# holds the number of positional parameters.
$- holds flags supplied to the shell.
$? holds the return value set by the previously executed command.
$$ holds the process number of the shell (current shell).
$! hold the process number of the last background command.
$@ holds all command line parameters or arguments.

$0 --> File name
$1 --> First args {$1...$9}

$# --> Args COUNT

$@ or $* --> Args List

#!/bin/bash
IFS=", "
echo "$@"  --> "vinodh" "kumar" "Thimmisetty"

echo "* Displaying all pizza names using \$*"
echo "$*" --> "vinodh,kumar,Thimmisetty"

$? = somevalue --> Assignment to special values are not allowed
