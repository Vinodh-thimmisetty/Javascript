#!/bin/bash --> Shebang Statement --> Bash Interpreter
# Learning basics of Unix/LINUX
# Author : Vinodh Kumar Thimmisetty <vinodh5052@gmail.com>

#~/.bashrc --> Any setting changes to shell
<<COMMENT_INTRODUCTION
 There are nearly 200+ LINUX Distributions.Kernal manages the Resources of
 LINUX such as File Management, Networking,Memory management etc. and decides
 who will use this resource and how long Kernal is intermediate layer between
 SHELL(Human Readable commands) & COMPUTE Hardware.

# ALl executable files will exists in ETC folder
COMMENT_INTRODUCTION


<<COMMENT_HELP
Help:
  man ls
  info ls
  ls --help
  ls -h
COMMENT_HELP


#AVAIALBLE_ACROSS_ALL_SHELLS : export -n
export BOSS="Vinodh Kumar Thimmisetty"
export sample="dummy"

# User input scanf()
 read userInput
 read -p userInput --> Prompt
 read -t 10 --> For user input wait for 10 seconds else program will be aborted
 read -s --> mask the value entered by user(whatever we type in terminal will not render on the screen)

# Check vairable exist or not

  ${name:?Error Message}

 # Declare Integers: If any char or string is assigned to Integer, variable will treat as ZERO value
 declare -i x=10

# CONSTANTs or READONLY:: Cannot UNSET ((until shell terminates the process))
 readonly COUNTRY="INDIA"
 declare -r EMAIL="vinodh5052\@gmail.com"

# Read Multiple Values based in dleimiter $IFS(Internal Field Separator)

  read -r $v1 $v2 $v3 <<< $BOSS

#Set & Unset Shell Varibales
set sample
unset $sample

set -o variableName --> ON
set +o variableName --> OFF

shopt -s variableName --> ON
shopt -u variableName --> OFF

e.g: ENabling spell Check
shopt -s cdspell

# Prefer PRINTF "%" to ECHO for formatting the varaible values

name="Vinodh Kumar Thimmisetty" --> length = 24

 if printf "%s\n" "${name}"  --> Vinodh Kumar Thimmisetty
 if %ns --> leaves ( n - stringlength ) LEADING space @@start
 if %-ns --> leaves ( n - stringlength ) TRAILING space @@END
 if %m.ns --> OCCUPY :m: spaces for :n: characters of a string

 e.g
     1. printf "%26s\n" "$name" --> (empty)(empty)Vinodh Kumar Thimmisetty
     2. printf "%-26s\n" $name --> Vinodh kumar Thimmisetty(empty)(empty)
     2. printf "%4.1s\n" $name --> (empty)(empty)(empty)V
     3. printf "%4.2s\n" "${name}" -->  (empty)(empty)Vi


# String Pattern
echo {Vinodh,Kumar,Thimmisetty}
# remove all java,js,sh files inside vinodh folder
rm -f /vinodh/test.{java,js,sh}
rm -f /vinodh/*.{java.js.sh}
rm -f /vinodh/[ab]*.{js,java,sh}

#[[ Most repeated commands are combined and alias it something we remember ]]
alias clr="clear"
alias list="ls -lrt"
unalias clr
unalias -a --> Removes all aliases

# To print date on executing of every command in shell
$PS1 --> Primary Prompt
$PROMPT_COMMAND=date  --> Executed as command before executing the $PS1

<<COMMENT_COMMANDS

1. To Check available shells
    cat /etc/shells

2.  Command Line Interface --> Current Shell type
    echo $SHELL
    ps $$
    which bash

3. Useful Shortcuts
    CTRL + L --> Clear the Screen
    CTRL + U --> Clear the current Line

4. date --> Numeric representation
   %Y --> Year
   %m --> Month
   %d --> Day
   %H --> Hour
   %M --> Minute
   %S --> Second
COMMENT_COMMANDS

# List of available Shell Packages
apt-cache search Shell --> Redhat + Centos + Fedora
yum search shell --> Debian + Ubuntu


<<COMMAND_CHMOD
# 4--> Read(r) | 2--> Write(w) | 1-->Execute(x)
# user(u) | group(g) | owner(o)

# ALL ROLES
  chmod 777 scriptName.sh
  chmod +rwx scriptName.sh

# INDIVIDUAL ROLE
  chmod u+x scriptName.sh
  chmod u=rwx,g=rwx,o=rwx scriptName.sh
  chmod ugo= scriptName --> Removes Permissions

COMMAND_CHMOD


<<COMMAND_INBUILT
 set -x  --> Displays commands and their args as they are executed
 set -n --> Read the command but not execute

COMMAND_INBUILT

# New Line Split in BASH
echo -e "My Name is \n Vinodh \n Kumar \n Thimmisetty"

# -e enables escaping sequences for special characters


<<COMMAND_ENVIRONMENT_VARIABLES
# ALL UPPER CASE
  env
  printenv
  set --> System Variables including All functions
COMMAND_ENVIRONMENT_VARIABLES

<<COMMAND_SHELLPROMPTS

1. \d --> Date format "Mon Apr 20"
2. \t --> Time in 21:23:21 format
3. \T --> Time in 01:33:32 format
4. \A --> Time in 21:31 format (No seconds)
5. \@ --> Time in 03:21 am/pm format

COMMAND_SHELLPROMPTS
