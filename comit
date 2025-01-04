#!/bin/bash

#colors




red='\033[31m'
green='\033[0;32m'
reset_color='\033[0m'

# Staging all changes


git add .

# Geting the  lists of added, modified, and deleted files


added=$(git diff --cached --name-only --diff-filter=A)
updated=$(git diff --cached --name-only --diff-filter=M)
deleted=$(git diff --cached --name-only --diff-filter=D)

# Constructing  the commit message



commit_message="I"
if [[ -n "$added" ]]; then
    commit_message="$commit_message ADDED $(echo "$added" | sed 's/^/#/' | paste -sd ', ')"
fi


if [[ -n "$updated" ]]; then
    commit_message="$commit_message, UPDATED $(echo "$updated" | sed 's/^/#/' | paste -sd ', ')"
fi


if [[ -n "$deleted" ]]; then
    commit_message="$commit_message, and DELETED $(echo "$deleted" | sed 's/^/#/' | paste -sd ', ')"
fi


# Handle case where there are no changes


if [[ "$commit_message" == "I" ]]; then
    echo -e "${red}No changes to commit.${reset_color}"
    exit 1
fi

# Auto-generated commit message

echo -e "${green}Auto-generated commit message: $commit_message${reset_color}"

if git commit -m "$commit_message"; then
    echo -e "${green}Commit successful. Pushing to remote...${reset_color}"
    git push
    echo -e "${green}Pushed to remote${reset_color}"
else

    # User Information

    error=$(git commit -m "$commit_message" 2>&1)
    if echo "$error" | grep -q "Please tell me who you are."; then
        git config --global user.email "h.nyahoja@alustudent.com"
        git config --global user.name "Humphrey Nyahoja"
        echo -e "${green}Email and name updated. Please commit again.${reset_color}"
    else
        echo -e "${red}Commit failed due to an unexpected error.${reset_color}"
    fi
fi

