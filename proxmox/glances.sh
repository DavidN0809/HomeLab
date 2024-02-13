#!/bin/bash

# Step 1: Clean up the specified directory
echo "Cleaning up EXTERNALLY-MANAGED directories..."
rm -rf /usr/lib/python3.*/EXTERNALLY-MANAGED

# Step 2: Install Glances
echo "Installing Glances..."
curl -L https://bit.ly/glances | /bin/bash

echo "Please manually start Glances to set up username and password:"
echo "glances -w --username --password"
echo "Remember to write down the password as it's saved in the config file."

# Step 4: Configure drivetemp module to load at boot and load it now
echo "Configuring drivetemp module..."
echo "drivetemp" >> /etc/modules
modprobe drivetemp

# Step 5 & 6: Create and configure the Glances service
echo "Creating Glances service..."
cat <<EOF > /etc/systemd/system/glances.service
[Unit]
Description=Glances
After=network.target

[Service]
ExecStart=/usr/local/bin/glances -w -u glances
Restart=on-abort
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

# Step 7: Enable the Glances service
echo "Enabling Glances service..."
systemctl enable glances.service

# Step 8: Start the Glances service
echo "Starting Glances service..."
systemctl start glances.service

echo "Glances installation and configuration script has completed."
