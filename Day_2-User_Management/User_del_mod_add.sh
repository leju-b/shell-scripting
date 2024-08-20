#!/bin/bash

##########################################################
#
# Author: Leju B                                         
# Date: 20-08-2024
# 
# Version: v1
#
# About: To create, Delete, Modify Users
#
# Input: operation username [options]
#
##########################################################


if [ "$(id -u)" -ne 0 ]; then
	echo "please run as root or use sudo"
	exit 1
fi

usage(){
	echo "Usage $0 {create|delete|modify} username [options]"
	exit 1
}

create_user(){
	local username=$2
	useradd -m "$username" --badname
	[ $? -eq 0 ] && echo "user $2 added to the system." || echo "failed to add user $2."
}

delete_user(){
	local username=$2
	userdel "$username"
	[ $? -eq 0 ] && echo "user $2 has been deleted." || echo "failed to delete user $2."
}

modify_user(){
	local username=$2
	local shell=$3
	usermod -s "$shell" "$username"
	[ $? -eq 0 ] && echo "user $2 has been changed to $3." || echo "failed to change shell for user $3"
}

if [ $# -lt 2 ];then
	usage
fi

case "$1" in
	create)
		create_user "$2"
		;;

	delete)
		delete_user "$2"
		;;	

	modify)
		[ $# -ne 3 ] && usage
		modify_user "$2" "$3"
		;;

	*)
		usage
		;;

esac
