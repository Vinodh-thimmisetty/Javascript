#!/bin/bash

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

: '

	1. Pass the File as INPUT to a WHILE Loop.
	2. Read file content  Line by Line and echo it for debugging
	3. Convert Search Term into Lower or Upper Case [[optional, can directly convert while testing the match ]]
	4. Convert Each Line into Lower or Upper Case [[optional, can directly convert while testing the match ]]
	5. Read each word in a File <-- Its based on IFS(Internal Field Separator) which has "SPACE" as default delimiter
	6. Test word matches with Search Key and increase the counter variable 
 
'

while read -r eachLine
do
   echo "::::::$eachLine:::::::"
	
	for eachWord in $eachLine
	do
	    [[ "${eachWord,,}" == "${SEARCH_WORD,,}" ]] &&  (( COUNT++ ))		
	done	    

done < "$LOG_PATH"

echo "Count is:::: $COUNT"


: '
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

'

#Temporary Variables
LINE_NUMBER=0
TEMP_COUNT=0
TOTAL_COUNT=0
LOGGED_IN_USER=$(whoami)
EXTERNAL_FILE_PATH=/home/vinodh/temp
CURRENT_DATE=$(date +"%d-%m-%Y")
CURRENT_TIMESTAMP=$(date +"%T")

# Create a directoty if not Exists
[[ ! -d "$EXTERNAL_FILE_PATH" ]] && mkdir -p "$EXTERNAL_FILE_PATH"

# Create a Log File if not Exists with above mentioned format in the requirements
# Concat the File Name with static string AND append with full File Path

LOG_FILE_NAME="${CURRENT_DATE}_countMatch.log"
LOG_FILE_FULL_PATH="$EXTERNAL_FILE_PATH/$LOG_FILE_NAME"

[[ ! -f "$LOG_FILE_FULL_PATH" ]] && { echo "No File Existst"; touch "$LOG_FILE_FULL_PATH" || echo "File $LOG_FILE_FULL_PATH Exists"; } 

# Change the Permission of a File

chmod +rwx "$LOG_FILE_FULL_PATH"

echo "################################################ $CURRENT_DATE :: $CURRENT_TIMESTAMP :: Executed by ==> $LOGGED_IN_USER #################################" >> "$LOG_FILE_FULL_PATH" 

# Total Number of Lines in a File
echo -e "\\nTotal Number of Lines in File: $LOG_FILE_FULL_PATH is: $(wc -l "$LOG_PATH" | cut -d " " -f1) \\n" >> "$LOG_FILE_FULL_PATH"

while read -r eachLine
do
	(( LINE_NUMBER++ ))
	for eachWord in $eachLine
	do
		[[ "${eachWord^^}" == "${SEARCH_WORD^^}" ]] && { (( TEMP_COUNT++ )); (( TOTAL_COUNT++ )); } 	
	done
	# Logging into external file Starts
		echo "Number of matches of word: $SEARCH_WORD in Line:: $LINE_NUMBER is: $TEMP_COUNT" >> $LOG_FILE_FULL_PATH

		# RESET THE TEMP_COUNTER to ZERO
		TEMP_COUNT=0
	# Logging into external file Ends
done < "$LOG_PATH"
	
	# Print the Total Count
	echo -e "\\n Total Matches :: $TOTAL_COUNT \\n" >> "$LOG_FILE_FULL_PATH"

echo "################################################ $CURRENT_DATE :: $CURRENT_TIMESTAMP :: Executed by ==> $LOGGED_IN_USER #################################" >> "$LOG_FILE_FULL_PATH"

# Set DEBUG = OFF --> Applicable only for Testing Environments
set +x



