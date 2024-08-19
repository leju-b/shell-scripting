#!/bin/bash

##########################################################
#
# Author: Leju B                                         
# Date: 19-08-2024
# 
# Version: v1
#
# About: Copying a File from one destination to another
#
# Input: Operation File1 File2
#
##########################################################

if [ ! -f $2 ]; then #this loop statement checks wheather the file exists or not

	echo "File does not exist."
	exit 1

fi	


original_extension="${2##*.}" # Extract the file extension from the original file


if [[ "$3" != *.* ]]; then # Check if the new name includes an extension
    new_name="$3.$original_extension"
else
    new_name="$3"
fi

case $1 in #to select which operation to be excecute bases on input

	copy) #copy operation

		cp $2 $3
		;;
	
	rename) #rename operation

		mv $2 $3
		;;

	move) #move operation

		mv $2 $3
		;;

	delete) #delete operation

		rm $2
		;;

	*)
		echo "invalid operation please select copy, move, rename or delete"
		;;

esac		



