#!/bin/bash

# Step 1: Download get-pip.py
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

# Step 2: Execute get-pip.py to install pip
python3 get-pip.py

# Step 3: Add pip's local bin directory to PATH in .bashrc
# Check if the line already exists to avoid adding it multiple times
if ! grep -qxF 'export PATH="$HOME/.local/bin:$PATH"' ~/.bashrc; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
fi

# Step 5: Install ansible
python3 -m pip install --user ansible

# Reminder for the user
echo "Please run 'source ~/.bashrc' to update your PATH."
