#!/bin/bash

# Run system update
apt-get update

# install curl
apt install curl -y

# install tar
apt install tar -y


## Install Nodejs

# Check available Node.js Version
apt policy nodejs

# Install Nodejs & NPM
apt-get install nodejs -y

apt install npm -y

# Install Nginx
apt-get install nginx -y

# Start nginx
service nginx start

# Ensure every time you restart your system Nginx starts up automatically.
systemctl enable nginx


#Install nano text editor
apt-get install nano -y

#install pm2
npm install pm2 -g -y

#Configure PM2 to start Express application at startup.
env PATH=$PATH:/usr/local/bin pm2 startup -u ubuntu


# Github Hosted Runner
# Create a folder
mkdir actions-runner && cd actions-runner
# Download the latest runner package
curl -o actions-runner-linux-x64-2.316.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.316.0/actions-runner-linux-x64-2.316.0.tar.gz
# Optional: Validate the hash
echo "64a47e18119f0c5d70e21b6050472c2af3f582633c9678d40cb5bcb852bcc18f  actions-runner-linux-x64-2.316.0.tar.gz" | shasum -a 256 -c
# Extract the installer
tar xzf ./actions-runner-linux-x64-2.316.0.tar.gz

# Create the runner and start the configuration experience
export RUNNER_ALLOW_RUNASROOT="1"
export SERVERNAME=$(echo $RANDOM)
./config.sh --url https://github.com/bcarranza/money-tracker --token AEWG2K2KKV3BKMDD5OXRHZ3GGMNAS --name webserver-$(echo $SERVERNAME) --labels $(echo $SERVERNAME) --unattended
# Last step, run it!
nohup ./run.sh > /dev/null 2>&1 &


