#!/bin/bash

##########################################################################
#
# Author: Leju B
# Date: 10/08/2024
# version: v1
#
# About: To list the collaborators who has pull access for a repository on a organization
#
# Inputs: Repository Owner and repository name
#
##########################################################################

# Requesting the user to provide necessary inputs if not already provided
if [ $# -ne 2 ]; then
	echo "Provide RepoOwner and RepoName while excecuting"
	echo "syntax: ./NAMEOFFILE.sh REPO-OWNER REPO-NAME"
	exit 1
fi	

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME=$username
TOKEN=$token

# User and Repository information
REPO_OWNER=$1
REPO_NAME=$2


# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository
function list_users_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Fetch the list of collaborators on the repository
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

    # Display the list of collaborators with read access
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:" > List-users
        echo "$collaborators" >> List-users
    fi
}

# Main script

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access
