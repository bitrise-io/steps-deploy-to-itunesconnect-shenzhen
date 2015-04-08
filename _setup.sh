#!/bin/bash

set -e

command_exists () {
	command -v "$1" >/dev/null 2>&1 ;
}

if command_exists ipa ; then
	echo " (i) shenzhen already installed"
	exit 0
else
	echo " (i) shenzhen NOT yet installed, attempting install..."
fi

STARTTIME=$(date +%s)

if command_exists rvm ; then
	echo " -> installing with RVM"
	gem install shenzhen
elif command_exists rbenv ; then
	echo " -> installing with rbenv"
	gem install shenzhen
	rbenv rehash
else
	echo " [!] Failed to install: neither RVM nor rbenv is available!"
	exit 1
fi

ENDTIME=$(date +%s)
echo
echo " (i) Setup took $(($ENDTIME - $STARTTIME)) seconds to complete"
echo
