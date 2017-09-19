#!/bin/bash --> Shebang Statement --> Bash Interpreter
# Learning basics of Unix/LINUX
# Author : Vinodh Kumar Thimmisetty <vinodh5052@gmail.com>
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


<<COMMAND_ENVIRONMENT_VARIABLES
# ALL UPPER CASE
  env
  printenv
  set --> System Variables including All functions
COMMAND_ENVIRONMENT_VARIABLES

# Prefer PRINTF "%" to ECHO for formatting the varaible values
