#/bin/bash

# SET Debugging 
set -x

# Declare Local Variables
count=0

# Validate whether the File Name is passed or not
echo "Number of Arguments:: $#"
[ $# -ne 1 ] &&  { echo "No input File Name" || echo "Has only ONE input"; exit 1; }

# Read the File Name Argument
fileName=$1

# Validate the passed Argument is File or Not
[ ! -f $fileName ] && { echo "Please pass File as Argument" ||  exit 2; }

# Read a File character by character
while read -n 1 eachChar
do
    #Convert each letter to Case Sensitive
     eChar="${eachChar^^}"
    echo "Character reading is ...........$eChar"	
    case $eChar in 
	A|E|I|O|U)
		echo ".............................Vowel..................."
		count=$((count+1))
		;;
        *)
	echo "................................Not a Vowel................"
	;;
    esac 
done < $fileName # Input File into LOOP V.IMP

echo "Number of Vowels:: $count"
 
# CLose the Debugging
set +x
