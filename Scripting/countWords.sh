#/bin/bash

# ------------------------------------------------------------------------------------------------------
# Purpose: This script is used to count Number of occurences of word "vinodh" in a log file
# Author: Vinodh Kumar Thimmisetty
# Created Date: 21-SEP-2017
# Last Modified Date: 21-SEP-2017
# Versions : 1
# Error Codes:  0 (Successfull)
#		1 (No Input argument)
#		2 (Not a Valid Log File)
#               3 ()
# Note:  1. Case Insensitive Search has to perform
#	 2. Search Word can alse pass as second argument to a file <== Future Release :-)
# 	 3. File Full path can be passed as arguemnt instead of file Name
# ------------------------------------------------------------------------------------------------------


# Set DEBUG = ON  --> Applicable only for Testing Environments
set -x

# Load Temporary variables if any
SEARCH_WORD="vinodh"
COUNT=0

# Check whether only ONE Argument is passed or not
[[ $# -ne 1 ]] && { echo "No Argument passed"; exit 1; }

# Assign the File Name to GLOBAL variable
LOG_PATH=$1

# Check whether the Argument passed is Valid File or not
[[ ! -f  $LOG_PATH ]] && { echo "Not a File"; exit 2;  } 

<<EXECUTION_STEPS

	1. Pass the File as INPUT to a WHILE Loop.
	2. Read file content  Line by Line and echo it for debugging
	3. Convert Search Term into Lower or Upper Case [[optional, can directly convert while testing the match ]]
	4. Convert Each Line into Lower or Upper Case [[optional, can directly convert while testing the match ]]
	5. Read each word in a File <-- Its based on IFS(Internal Field Separator) which has "SPACE" as default delimiter
	6. Test word matches with Search Key and increase the counter variable 
 
EXECUTION_STEPS

while read eachLine
do
   echo "::::::$eachLine:::::::"
	
	for eachWord in $eachLine
	do
	    [[ "${eachWord,,}" == "${SEARCH_WORD,,}" ]] &&  (( COUNT++ ))		
	done	    

done < $LOG_PATH

echo "Count is:::: $COUNT"


<<COMMENTS
	Additional Requirement:
		1.  Pass the Line Numbers with Count of search term to some external File : vinodh-count.txt in /tmp/VINODH directory
		2.  Create output log file if necessary inside Directory /tmp/OUTPUT
		3.  Log File Name Format is : 20-sep-2017-countMatch.log
		4.  Append the Logs (If Log file exist for that day) and each Log Entry has to be like

		########################## DATE + TIME STAMP + USER Who executed the Script #################################

				log file content 1
				log file content 2
				..................
				.................
				log file content n

		########################## DATE + TIME STAMP + USER Who executed the Script #################################

COMMENTS

# Set DEBUG = OFF --> Applicable only for Testing Environments
set +x
