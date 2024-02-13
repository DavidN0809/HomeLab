#!/bin/bash

# Update your repositories and install GitHub CLI
echo "Updating repositories..."
sudo apt-get update

echo "Installing GitHub CLI..."
sudo apt-get install gh -y

# Step 1: Configure Git user information
git config --global user.email "alwaysbrother10@gmail.com"
git config --global user.name "David"
echo "Git user name and email configured."

# Step 2: Check for existing SSH keys or generate a new SSH key pair
SSH_KEY_PATH="$HOME/.ssh/id_rsa"
if [ -f "$SSH_KEY_PATH" ]; then
    echo "SSH key already exists at $SSH_KEY_PATH."
else
    # Generate a new SSH key
    ssh-keygen -t rsa -b 4096 -C "alwaysbrother10@gmail.com" -f "$SSH_KEY_PATH" -N ""
    echo "SSH key generated at $SSH_KEY_PATH."
fi

# Step 3: Start the ssh-agent in the background and add your SSH key
eval "$(ssh-agent -s)"
ssh-add "$SSH_KEY_PATH"
echo "SSH key added to ssh-agent."

# Step 4: Login to GitHub with the GitHub CLI
# This step requires user interaction to complete the authentication process
echo "Please follow the prompts to login to GitHub with the GitHub CLI..."
gh auth login

# Step 5: Upload the SSH key to your GitHub account using the GitHub CLI
# The user will be prompted to give the key a title during the upload process
echo "Uploading SSH key to your GitHub account..."
gh ssh-key add "$SSH_KEY_PATH.pub"

echo "Setup complete. Your SSH key has been added to your GitHub account."
