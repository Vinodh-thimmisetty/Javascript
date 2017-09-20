#/bin/bash
# Purpose:
# Author:
# Note:
# Version:
# Last Modified on:
# Last Modified by:
# Error Codes: ZERO(Success), Non-zero(failure {1==> Minor, 2==>Severe})
# ------------------------------------

# Get the IP Address based on DOMAIN(www.google.com)
nslookup www.google.com
host www.google.com
dig +short www.google.com

# Genarate a number (random number) between 1 and 10
r=$(( $RANDOM%10+0 ))
