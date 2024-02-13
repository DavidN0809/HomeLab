#!/bin/bash

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
echo "If you haven't already, add your SSH public key to your GitHub account."
echo "Your SSH public key is located at ${SSH_KEY_PATH}.pub"
