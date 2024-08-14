# GitHub Repository Collaborators List

**Author**: Leju B  
**Date**: 10/08/2024  
**Version**: v1

---

This script lists the collaborators who have **pull access** for a specified repository within an organization on GitHub.

## **About**

This script utilizes the GitHub API to retrieve a list of collaborators for a given repository. It requires the repository owner's username and the repository name as input parameters.

## **Inputs**

- **Repository Owner**: The GitHub username of the repository owner.
- **Repository Name**: The name of the repository.

## **Usage**

1. **Ensure you have a GitHub personal access token** with appropriate permissions and your GitHub username.
2. **Provide your GitHub username and personal access token** by setting them in the environment variables `$username` and `$token`, respectively.
3. **Save the script** in a file, for example, `list_collaborators.sh`.
4. **Make the script executable** by running:  
   ```bash
   chmod +x list_collaborators.sh
   ```
5. **Run the script** with the repository owner's username and repository name as arguments:  
   ```bash
   ./list_collaborators.sh REPO-OWNER REPO-NAME
   ```

## **Script Breakdown**

- **User Input Check**:
  - The script checks if the required inputs (repository owner and repository name) are provided. If not, it prompts the user with the correct syntax and exits.

- **GitHub API Configuration**:
  - **API URL**: The base URL for the GitHub API.
  - **Username and Personal Access Token**: Your GitHub credentials for API authentication.

- **Function: `github_api_get`**:
  - This function sends a GET request to the GitHub API, authenticating with the provided username and personal access token.

- **Function: `list_users_with_read_access`**:
  - Retrieves the list of collaborators from the specified repository.
  - Filters collaborators who have pull access using the `jq` tool.
  - Outputs the list of collaborators to a file named `List-users`.

## **Output**

The script generates a file named `List-users` containing the GitHub usernames of the collaborators with pull access to the specified repository.

---

**Note**: Make sure to handle your GitHub personal access token securely and only use it with trusted scripts.