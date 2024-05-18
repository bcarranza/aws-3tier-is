#!/bin/bash

# Run system update
apt-get update

# install curl
apt install curl -y

# install tar
apt install tar -y


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
export SERVERNAME="money-tracker-deploy"
./config.sh --url https://github.com/bcarranza/money-tracker --token AEWG2K2VFUPK3BUGVISOLSLGJBNPK --name webserver-$(echo $SERVERNAME) --labels $(echo $SERVERNAME) --unattended
# Last step, run it!
nohup ./run.sh > /dev/null 2>&1 &